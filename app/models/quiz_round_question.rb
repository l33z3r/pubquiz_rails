# == Schema Information
#
# Table name: quiz_round_questions
#
#  id                        :integer          not null, primary key
#  quiz_round_id             :integer
#  question_id               :integer
#  sorting_order             :integer
#  time_limit_in_seconds     :integer
#  points_for_correct_answer :integer
#  points_for_wrong_answer   :integer
#  points_for_no_answer      :integer
#  created_at                :datetime
#  updated_at                :datetime
#

class QuizRoundQuestion < ActiveRecord::Base

  # Constants

  # relationships
  belongs_to :quiz_round
  belongs_to :question
  has_many :question_answers, through: :question

  # validation
  validates :quiz_round_id, presence: true,
            numericality: {only_integer: true, greater_than: 0}
  validates :question_id, presence: true,
            numericality: {only_integer: true, greater_than: 0}
  validates :sorting_order, presence: true,
            numericality: {only_integer: true}
  validates :time_limit_in_seconds, presence: true,
            numericality: {only_integer: true}
  validates :points_for_correct_answer, presence: true,
            numericality: {only_integer: true}
  validates :points_for_wrong_answer, presence: true,
            numericality: {only_integer: true}
  validates :points_for_no_answer, presence: true,
            numericality: {only_integer: true}

  # callbacks
  before_destroy :check_dependencies

  # scopes
  scope :all_in_order, -> { order(:quiz_round_id, :sorting_order) }

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
