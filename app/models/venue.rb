# == Schema Information
#
# Table name: venues
#
#  id                :integer          not null, primary key
#  public_title      :string(255)
#  address           :text
#  latitude          :float(24)
#  longitude         :float(24)
#  created_by        :integer
#  updated_by        :integer
#  publicly_visible  :boolean
#  approved_by       :integer
#  time_zone         :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  logo_file_name    :string(255)
#  logo_content_type :string(255)
#  logo_file_size    :integer
#  logo_updated_at   :datetime
#

class Venue < ActiveRecord::Base

  has_attached_file :logo
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

  # Constants

  # relationships
  belongs_to :approver, class_name: 'User', foreign_key: :approved_by
  belongs_to :creator, class_name: 'User', foreign_key: :created_by
  belongs_to :updater, class_name: 'User', foreign_key: :updated_by
  has_many :quiz_events

  # validation
  validates :public_title, presence: true
  validates :address, presence: true
  validates :latitude, allow_nil: true, numericality: true
  validates :longitude, allow_nil: true, numericality: true
  validates :created_by, presence: true,
            numericality: {only_integer: true, greater_than: 0}
  validates :updated_by, allow_nil: true,
            numericality: {only_integer: true, greater_than: 0}
  validates :approved_by, allow_nil: true,
            numericality: {only_integer: true, greater_than: 0}
  validates :time_zone, presence: true

  # callbacks
  before_destroy :check_dependencies

  # scopes
  scope :all_in_order, -> { order(:public_title) }
  default_scope{all_in_order}
  scope :find_near_to, lambda { |target_lat, target_lon, range=0.05|
          where('latitude BETWEEN :lat1 AND :lat2 AND longitude BETWEEN :lon1 AND :lon2',
          lat1: target_lat - range, lat2: target_lat + range,
          lon1: target_lon - range, lon2: target_lon + range) }
  scope :visible_to_user, lambda {|user_id| where('created_by = ? OR (publicly_visible = ? AND approved_by > ?)', user_id, true, 0) }

  # class methods

  # instance methods
  def destroyable?
    self.quiz_events.empty?
  end

  protected

  def check_dependencies
    unless self.destroyable?
      errors.add(:base, "Couldn't be deleted because dependencies exist")
      false
    end
  end

end
