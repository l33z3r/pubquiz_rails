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

require 'spec_helper'

describe QuestionAnswer do

  # Constants
  #it { QuestionAnswer.const_defined?(:CONSTANT_NAME) }

  # relationships
  it { should belong_to(:question) }

  # validation
  it { should_not validate_presence_of(:question_id) }
  it { should validate_numericality_of(:question_id) }

  it { should validate_presence_of(:visible_text) }

  it { should validate_presence_of(:sorting_order) }
  it { should validate_numericality_of(:sorting_order) }

  # callbacks
  it { should callback(:check_dependencies).before(:destroy) }

  # scopes
  it { QuestionAnswer.should respond_to(:all_in_order) }

  # class methods
  
  # instance methods
  it { should respond_to(:destroyable?) }
  
end
