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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :quiz_round do
    quiz_event_id 1
    name "MyString"
    created_by 1
    updated_by 1
    question_category_id 1
    sorting_order 1
  end
end
