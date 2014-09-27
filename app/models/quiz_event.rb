# == Schema Information
#
# Table name: quiz_events
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  description        :text
#  time_zone          :string(255)
#  starts_at          :datetime
#  venue_id           :integer
#  created_by         :integer
#  updated_by         :integer
#  event_guid         :string(255)
#  sponsor_logo_url   :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  logo_file_name     :string(255)
#  logo_content_type  :string(255)
#  logo_file_size     :integer
#  logo_updated_at    :datetime
#  open_to_the_public :boolean
#  event_status       :string(255)
#

class QuizEvent < ActiveRecord::Base

  has_attached_file :logo
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

  # Constants
  STATUSES = %w(future open running paused closed)
            # future   - will be held in the future
            # open     - not started yet, but you can join a team, etc.
            # running  - quiz in operation. Can't change team.
            # paused   - running, but questions flow on hold
            # closed   - quiz operation complete.

  # relationships
  belongs_to :creator, class_name: 'User', foreign_key: :created_by
  has_many :event_team_members, through: :teams
  has_many :quiz_rounds
  has_many :teams
  belongs_to :updater, class_name: 'User', foreign_key: :updated_by
  belongs_to :venue

  # validation
  validates :event_status, inclusion: {in: STATUSES}
  validates :name, presence: true
  validates :time_zone, presence: true
  validates :starts_at, presence: true
  validates :venue_id, presence: true,
            numericality: {only_integer: true, greater_than: 0}
  validates :created_by, presence: true,
            numericality: {only_integer: true, greater_than: 0}
  validates :updated_by, allow_nil: true,
            numericality: {only_integer: true, greater_than: 0}

  # callbacks
  before_validation :generate_event_guid, on: :create
  before_destroy :check_dependencies

  # scopes
  scope :all_in_order, -> { order(:name) }
  scope :happening_soon, -> { where('starts_at > ? AND starts_at < ?',
                                    Proc.new{Time.now - 2.hours}.call,
                                    Proc.new{Time.now + 1.day}.call ) }
  scope :near, lambda {|lat, lon, range| where(venue_id: Venue.find_near_to(lat, lon, range).map(&:id)) }

  # class methods

  # instance methods
  def current?
    self.starts_at > Proc.new { Time.now - 2.hours }.call && self.starts_at < Proc.new { Time.now + 1.day }.call
  end

  def destroyable?
    self.quiz_rounds.empty? && self.teams.empty?
  end

  def in_dst
    # returns true or false
    original_time_zone = Time.zone
    Time.zone = self.time_zone
    answer = Time.zone.at(self.starts_at).dst?
    Time.zone = original_time_zone
    answer
  end

  def starts_at_epoch
    self.starts_at.to_i
  end

  def time_zone_offset_minutes
    original_time_zone = Time.zone
    Time.zone = self.time_zone
    answer = Time.zone.at(self.starts_at).utc_offset
    Time.zone = original_time_zone
    answer / 60
  end

  protected

  def generate_event_guid
    self.event_guid ||= ApplicationController.generate_random_code(8)
  end

  def check_dependencies
    unless self.destroyable?
      errors.add(:base, "Couldn't be deleted because dependencies exist")
      false
    end
  end

end
