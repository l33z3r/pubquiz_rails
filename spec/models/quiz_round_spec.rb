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

require 'spec_helper'

describe QuizRound do

  # Constants
  #it { QuizRound.const_defined?(:CONSTANT_NAME) }

  # relationships
  it { should belong_to(:creator) }
  it { should belong_to(:quiz_event) }
  it { should belong_to(:question_category) }
  it { should belong_to(:updater) }

  # validation
  it { should validate_presence_of(:quiz_event_id) }
  it { should validate_numericality_of(:quiz_event_id) }

  it { should validate_presence_of(:name) }

  it { should validate_presence_of(:created_by) }
  it { should validate_numericality_of(:created_by) }

  it { should_not validate_presence_of(:updated_by) }
  it { should validate_numericality_of(:updated_by) }

  it { should validate_presence_of(:question_category_id) }
  it { should validate_numericality_of(:question_category_id) }

  it { should validate_presence_of(:sorting_order) }

  # callbacks
  it { should callback(:check_dependencies).before(:destroy) }

  # scopes
  it { QuizRound.should respond_to(:all_in_order) }

  # class methods
  
  # instance methods
  it { should respond_to(:destroyable?) }
  
end
