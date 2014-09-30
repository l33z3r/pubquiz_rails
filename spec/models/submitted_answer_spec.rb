# == Schema Information
#
# Table name: submitted_answers
#
#  id                     :integer          not null, primary key
#  event_team_member_id   :integer
#  user_id                :integer
#  team_id                :integer
#  quiz_event_id          :integer
#  quiz_round_question_id :integer
#  question_answer_id     :integer
#  correct                :boolean
#  points_scored          :integer
#  question_asked_at      :datetime
#  question_answered_at   :datetime
#  created_at             :datetime
#  updated_at             :datetime
#  quiz_round_id          :integer
#

require 'spec_helper'

describe SubmittedAnswer do

  # Constants
  #it { SubmittedAnswer.const_defined?(:CONSTANT_NAME) }

  # relationships
  it { should belong_to(:event_team_member) }
  it { should belong_to(:question_answer) }
  it { should belong_to(:quiz_event) }
  it { should belong_to(:quiz_round_question) }
  it { should belong_to(:team) }
  it { should belong_to(:user) }

  # validation
  it { should validate_presence_of(:event_team_member_id) }
  it { should validate_numericality_of(:event_team_member_id) }

  it { should validate_presence_of(:points_scored) }
  it { should validate_numericality_of(:points_scored) }

  it { should_not validate_presence_of(:question_answer_id) }
  it { should validate_numericality_of(:question_answer_id) }

  it { should validate_presence_of(:question_asked_at) }

  it { should validate_presence_of(:question_answered_at) }

  it { should validate_presence_of(:quiz_event_id) }
  it { should validate_numericality_of(:quiz_event_id) }

  it { should validate_presence_of(:quiz_round_question_id) }
  it { should validate_numericality_of(:quiz_round_question_id) }

  it { should validate_presence_of(:team_id) }
  it { should validate_numericality_of(:team_id) }

  it { should validate_presence_of(:user_id) }
  it { should validate_numericality_of(:user_id) }

  # callbacks
  it { should callback(:set_quiz_round_id).before(:create) }
  it { should callback(:check_dependencies).before(:destroy) }

  # scopes
  it { SubmittedAnswer.should respond_to(:all_in_order) }

  # class methods
  
  # instance methods
  it { should respond_to(:destroyable?) }
  
end
