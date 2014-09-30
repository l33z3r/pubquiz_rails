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

require 'spec_helper'

describe QuestionCategory do

  # Constants
  #it { QuestionCategory.const_defined?(:CONSTANT_NAME) }

  # relationships
  it { should have_many(:child_categories) }
  it { should belong_to(:country) }
  it { should belong_to(:creator) }
  it { should belong_to(:parent_category) }
  it { should have_many(:questions) }
  it { should have_many(:quiz_rounds) }
  it { should belong_to(:updater) }

  # validation
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

  it { should_not validate_presence_of(:question_category_id) }
  it { should validate_numericality_of(:question_category_id) }

  it { should validate_presence_of(:created_by) }
  it { should validate_numericality_of(:created_by) }

  it { should_not validate_presence_of(:updated_by) }
  it { should validate_numericality_of(:updated_by) }

  it { should_not validate_presence_of(:country_id) }
  it { should validate_numericality_of(:country_id) }

  # callbacks
  it { should callback(:check_dependencies).before(:destroy) }

  # scopes
  it { QuestionCategory.should respond_to(:all_in_order) }

  # class methods
  
  # instance methods
  it { should respond_to(:destroyable?) }
  
end
