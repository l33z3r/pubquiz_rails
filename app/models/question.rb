# == Schema Information
#
# Table name: questions
#
#  id                   :integer          not null, primary key
#  question_category_id :integer
#  visible_text         :string(255)
#  correct_answer_id    :integer
#  created_by           :integer
#  updated_by           :integer
#  publicly_visible     :boolean
#  approved_by          :integer
#  created_at           :datetime
#  updated_at           :datetime
#  image_file_name      :string(255)
#  image_content_type   :string(255)
#  image_file_size      :integer
#  image_updated_at     :datetime
#

class Question < ActiveRecord::Base

  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  # Constants

  # relationships
  belongs_to :correct_answer, class_name: 'QuestionAnswer', foreign_key: :correct_answer_id
  has_many   :question_answers, inverse_of: :question
  accepts_nested_attributes_for :question_answers, allow_destroy: true,
             reject_if: lambda {|attributes| attributes['visible_text'].blank?}
  belongs_to :question_category

  # validation
  validates :question_category_id, presence: true,
            numericality: {only_integer: true, greater_than: 0}
  validates :visible_text, presence: true
  validates :correct_answer_id, allow_nil: true, on: :create,
            numericality: {only_integer: true, greater_than: 0}
  validates :correct_answer_id, presence: true, on: :update,
            numericality: {only_integer: true, greater_than: 0}
  validates :created_by, presence: true,
            numericality: {only_integer: true, greater_than: 0}
  validates :updated_by, allow_nil: true,
            numericality: {only_integer: true, greater_than: 0}
  validates :approved_by, allow_nil: true,
            numericality: {only_integer: true, greater_than: 0}

  # callbacks
  before_destroy :check_dependencies

  # scopes
  scope :all_in_order, -> { order(:visible_text) }

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
