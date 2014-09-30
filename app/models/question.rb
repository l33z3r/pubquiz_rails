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
#  country_id           :integer
#  year_from            :integer
#  year_to              :integer
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
  belongs_to :creator, class_name: 'User', foreign_key: :created_by
  belongs_to :updater, class_name: 'User', foreign_key: :updated_by
  belongs_to :approver, class_name: 'User', foreign_key: :approved_by
  belongs_to :country

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
  validates :country_id, allow_nil: true,
            numericality: {only_integer: true}
  validates :year_from, allow_nil: true,
            numericality: {only_integer: true}
  validates :year_to, allow_nil: true,
            numericality: {only_integer: true}

  # callbacks
  before_create :set_year_to
  before_destroy :check_dependencies

  # scopes
  scope :all_in_order, -> { order(:visible_text) }
  default_scope{all_in_order}

  # class methods

  # instance methods
  def destroyable?
    self.question_answers.empty?
  end

  protected

  def check_dependencies
    unless self.destroyable?
      errors.add(:base, "Couldn't be deleted because dependencies exist")
      false
    end
  end

  def set_year_to
    self.year_to ||= self.year_from
  end

end
