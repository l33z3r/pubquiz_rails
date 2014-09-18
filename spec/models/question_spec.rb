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

require 'spec_helper'

describe Question do

  # Constants
  #it { Question.const_defined?(:CONSTANT_NAME) }

  # relationships
  it { should belong_to(:correct_answer) }
  it { should have_many(:question_answers) }
  it { should belong_to(:question_category) }
  it { should belong_to(:creator) }
  it { should belong_to(:updater) }
  it { should belong_to(:approver) }

  # validation
  it { should validate_presence_of(:question_category_id) }
  it { should validate_numericality_of(:question_category_id) }

  it { should validate_presence_of(:visible_text) }

  it { should_not validate_presence_of(:correct_answer_id).on(:create) }
  it { should validate_presence_of(:correct_answer_id).on(:update) }
  it { should validate_numericality_of(:correct_answer_id) }

  it { should validate_presence_of(:created_by) }
  it { should validate_numericality_of(:created_by) }

  it { should_not validate_presence_of(:updated_by) }
  it { should validate_numericality_of(:updated_by) }

  it { should_not validate_presence_of(:approved_by) }
  it { should validate_numericality_of(:approved_by) }

  # callbacks
  it { should callback(:check_dependencies).before(:destroy) }

  # scopes
  it { Question.should respond_to(:all_in_order) }

  # class methods
  
  # instance methods
  it { should respond_to(:destroyable?) }
  
end
