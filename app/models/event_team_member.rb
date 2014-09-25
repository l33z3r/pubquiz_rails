# == Schema Information
#
# Table name: event_team_members
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  team_id         :integer
#  referral_from   :string(255)
#  device_platform :string(255)
#  device_type     :string(255)
#  tablet          :boolean
#  phone           :boolean
#  pc              :boolean
#  app_version_id  :integer
#  created_at      :datetime
#  updated_at      :datetime
#

class EventTeamMember < ActiveRecord::Base

  # Constants
  REFERRAL_SOURCES = %w(person, team, event)

  # relationships
  belongs_to :user
  belongs_to :team
  #belongs_to :app_version

  # validation
  validates :user_id, presence: true,
            numericality: {only_integer: true, greater_than: 0}
  validates :team_id, presence: true,
            numericality: {only_integer: true, greater_than: 0}
  #validates :referral_from, inclusion: {in: REFERRAL_SOURCES}
  #validates :device_platform, presence: true
  #validates :device_type, presence: true
  #validates :app_version_id, presence: true, numericality: {only_integer: true, greater_than: 0}

  # callbacks
  before_destroy :check_dependencies

  # scopes
  scope :all_in_order, -> { order(:team_id, :user_id) }

  # class methods

  # instance methods
  def destroyable?
    true
  end

  protected

  def check_dependencies
    unless self.destroyable?
      errors.add(:base, "Couldn't be deleted because dependencies exist")
      false
    end
  end

end
