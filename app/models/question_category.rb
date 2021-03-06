# == Schema Information
#
# Table name: question_categories
#
#  id                   :integer          not null, primary key
#  name                 :string(255)
#  question_category_id :integer
#  active               :boolean
#  created_by           :integer
#  updated_by           :integer
#  country_id           :integer
#  created_at           :datetime
#  updated_at           :datetime
#

class QuestionCategory < ActiveRecord::Base

  # Constants

  # relationships
  has_many :child_categories, class_name: 'QuestionCategory', foreign_key: :question_category_id
  belongs_to :country
  belongs_to :creator, class_name: 'User', foreign_key: :created_by
  belongs_to :parent_category, class_name: 'QuestionCategory', foreign_key: :question_category_id
  has_many :questions
  has_many :quiz_rounds
  belongs_to :updater, class_name: 'User', foreign_key: :updated_by

  # validation
  validates :name, presence: true, uniqueness: true
  validates :question_category_id, allow_nil: true,
            numericality: {only_integer: true, greater_than: 0}
  validates :created_by, presence: true,
            numericality: {only_integer: true, greater_than: 0}
  validates :updated_by, allow_nil: true,
            numericality: {only_integer: true, greater_than: 0}
  validates :country_id, allow_nil: true,
            numericality: {only_integer: true, greater_than: 0}

  # callbacks
  before_destroy :check_dependencies

  # scopes
  scope :all_in_order, -> { order(:name) }
  default_scope{all_in_order}

  # class methods

  # instance methods
  def destroyable?
    self.child_categories.empty? && self.questions.empty? && self.quiz_rounds.empty?
  end

  protected

  def check_dependencies
    unless self.destroyable?
      errors.add(:base, "Couldn't be deleted because dependencies exist")
      false
    end
  end

end
