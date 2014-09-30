# == Schema Information
#
# Table name: quiz_round_questions
#
#  id                        :integer          not null, primary key
#  quiz_round_id             :integer
#  question_id               :integer
#  sorting_order             :integer
#  time_limit_in_seconds     :integer
#  points_for_correct_answer :integer
#  points_for_wrong_answer   :integer
#  points_for_no_answer      :integer
#  created_at                :datetime
#  updated_at                :datetime
#

require 'spec_helper'

describe QuizRoundQuestion do

  # Constants
  #it { QuizRoundQuestion.const_defined?(:CONSTANT_NAME) }

  # relationships
  it { should belong_to(:quiz_round) }
  it { should belong_to(:question) }
  it { should have_many(:question_answers) }

  # validation
  it { should validate_presence_of(:quiz_round_id) }
  it { should validate_numericality_of(:quiz_round_id) }

  it { should validate_presence_of(:question_id) }
  it { should validate_numericality_of(:question_id) }

  it { should validate_presence_of(:sorting_order) }
  it { should validate_numericality_of(:sorting_order) }

  it { should validate_presence_of(:time_limit_in_seconds) }
  it { should validate_numericality_of(:time_limit_in_seconds) }

  it { should validate_presence_of(:points_for_correct_answer) }
  it { should validate_numericality_of(:points_for_correct_answer) }

  it { should validate_presence_of(:points_for_wrong_answer) }
  it { should validate_numericality_of(:points_for_wrong_answer) }

  it { should validate_presence_of(:points_for_no_answer) }
  it { should validate_numericality_of(:points_for_no_answer) }

  # callbacks
  it { should callback(:check_dependencies).before(:destroy) }

  # scopes
  it { QuizRoundQuestion.should respond_to(:all_in_order) }

  # class methods
  
  # instance methods
  it { should respond_to(:destroyable?) }

end
