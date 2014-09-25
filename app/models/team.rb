# == Schema Information
#
# Table name: teams
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  quiz_event_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

class Team < ActiveRecord::Base

  # Constants

  # relationships
  belongs_to :quiz_event
  has_many :event_team_members

  # validation
  validates :name, presence: true
  validates :quiz_event_id, presence: true, numericality: {only_integer: true, greater_than: 0}

  # callbacks
  before_destroy :check_dependencies

  # scopes
  scope :all_in_order, -> { order(:quiz_event_id, :name) }

  # class methods

  # instance methods
  def destroyable?
    self.event_team_members.empty?
  end

  protected

  def check_dependencies
    unless self.destroyable?
      errors.add(:base, "Couldn't be deleted because dependencies exist")
      false
    end
  end

end
