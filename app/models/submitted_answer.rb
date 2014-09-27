# == Schema Information
#
# Table name: submitted_answers
#
#  id                     :integer          not null, primary key
#  user_id                :integer
#  team_id                :integer
#  quiz_event_id          :integer
#  quiz_round_question_id :integer
#  question_answer_id     :integer
#  correct                :boolean
#  points_scored          :integer
#  question_asked_at      :datetime
#  question_answered_at   :datetime
#  created_at             :datetime
#  updated_at             :datetime
#

class SubmittedAnswer < ActiveRecord::Base

  # Constants

  # relationships
  belongs_to :user
  belongs_to :team
  belongs_to :quiz_event
  belongs_to :quiz_round_question
  belongs_to :question_answer

  # validation
  validates :user_id, presence: true,
            numericality: {only_integer: true, greater_than: 0}
  validates :team_id, presence: true,
            numericality: {only_integer: true, greater_than: 0}
  validates :quiz_event_id, presence: true,
            numericality: {only_integer: true, greater_than: 0}
  validates :quiz_round_question_id, presence: true,
            numericality: {only_integer: true, greater_than: 0}
  validates :question_answer_id, presence: true,
            numericality: {only_integer: true, greater_than: 0}
  validates :points_scored, presence: true,
            numericality: {only_integer: true}
  validates :question_asked_at, presence: true
  validates :question_answered_at, presence: true

  # callbacks
  before_destroy :check_dependencies

  # scopes
  scope :all_in_order, -> { order(:user_id) }

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
