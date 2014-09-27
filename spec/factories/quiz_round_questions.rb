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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :quiz_round_question do
    quiz_round_id 1
    question_id 1
    sorting_order 1
    time_limit_in_seconds 1
    points_for_correct_answer 1
    points_for_wrong_answer 1
    points_for_no_answer 1
  end
end
