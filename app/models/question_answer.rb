# == Schema Information
#
# Table name: question_answers
#
#  id                 :integer          not null, primary key
#  question_id        :integer
#  visible_text       :string(255)
#  sorting_order      :integer
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class QuestionAnswer < ActiveRecord::Base

  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  # Constants

  # relationships
  belongs_to :question, inverse_of: :question_answers

  # validation
  validates :question_id, allow_nil: true,
            numericality: {only_integer: true, greater_than: 0}
  validates :visible_text, presence: true
  validates :sorting_order, presence: true,
            numericality: {only_integer: true, greater_than: 0}

  # callbacks
  before_destroy :check_dependencies

  # scopes
  scope :all_in_order, -> { order(:question_id) }
  default_scope{all_in_order}

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
