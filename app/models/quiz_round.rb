# == Schema Information
#
# Table name: quiz_rounds
#
#  id                   :integer          not null, primary key
#  quiz_event_id        :integer
#  name                 :string(255)
#  created_by           :integer
#  updated_by           :integer
#  question_category_id :integer
#  sorting_order        :integer
#  created_at           :datetime
#  updated_at           :datetime
#

class QuizRound < ActiveRecord::Base

  # Constants

  # relationships
  belongs_to :creator, class_name: 'User', foreign_key: :created_by
  belongs_to :question_category
  belongs_to :quiz_event
  has_many :quiz_round_questions
  belongs_to :updater, class_name: 'User', foreign_key: :updated_by

  # validation
  validates :quiz_event_id, presence: true,
            numericality: {only_integer: true, greater_than: 0}
  validates :name, presence: true
  validates :created_by, presence: true,
            numericality: {only_integer: true, greater_than: 0}
  validates :updated_by, allow_nil: true,
            numericality: {only_integer: true, greater_than: 0}
  validates :question_category_id, presence: true,
            numericality: {only_integer: true, greater_than: 0}
  validates :sorting_order, presence: true,
            numericality: {only_integer: true, greater_than: 0}

  # callbacks
  before_destroy :check_dependencies

  # scopes
  scope :all_in_order, -> { order(:quiz_event_id, :sorting_order) }
  default_scope{all_in_order}

  # class methods

  # instance methods
  def destroyable?
    self.quiz_round_questions.empty?
  end

  protected

  def check_dependencies
    unless self.destroyable?
      errors.add(:base, "Couldn't be deleted because dependencies exist")
      false
    end
  end

end
