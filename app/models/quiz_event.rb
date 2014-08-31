class QuizEvent < ActiveRecord::Base

  has_attached_file :logo

  # Constants

  # relationships
  belongs_to :creator, class_name: 'User', foreign_key: :created_by
  belongs_to :updater, class_name: 'User', foreign_key: :updated_by
  #belongs_to :venue

  # validation
  validates :name, presence: true
  #validates :description, presence: true
  validates :time_zone, presence: true
  validates :starts_at, presence: true
  validates :venue_id, presence: true,
            numericality: {only_integer: true, greater_than: 0}
  validates :created_by, presence: true,
            numericality: {only_integer: true, greater_than: 0}
  validates :updated_by, allow_nil: true,
            numericality: {only_integer: true, greater_than: 0}
  # validates :sponsor_logo_url, presence: true

  # callbacks
  before_validation :generate_event_guid, on: :create
  before_destroy :check_dependencies

  # scopes
  scope :all_in_order, -> { order(:name) }

  # class methods

  # instance methods
  def destroyable?
    true # todo
  end

  def starts_at_epoch
    self.starts_at.to_i
  end

  def time_zone_offset_minutes
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
