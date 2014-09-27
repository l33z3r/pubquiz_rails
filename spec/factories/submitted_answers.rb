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
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :submitted_answer do
    user_id 1
    team_id 1
    quiz_event_id 1
    quiz_round_question_id 1
    question_answer_id 1
    correct false
    points_scored 1
    question_asked_at "2014-09-27 21:28:07"
    question_answered_at "2014-09-27 21:28:07"
  end
end
