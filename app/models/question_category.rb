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
  # todo belongs_to :country
  belongs_to :creator, class_name: 'User', foreign_key: :created_by
  belongs_to :updater, class_name: 'User', foreign_key: :updated_by
  belongs_to :parent_category, class_name: 'QuestionCategory', foreign_key: :question_category_id

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

  # class methods

  # instance methods
  def destroyable?
    true # todo
  end

  protected

  def check_dependencies
    unless self.destroyable?
      errors.add(:base, "Couldn't be deleted because dependencies exist")
      false
    end
  end

end
