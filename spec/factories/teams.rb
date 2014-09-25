# == Schema Information
#
# Table name: teams
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  quiz_event_id :integer
#  created_at    :datetime
#  updated_at    :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :team do
    name "MyString"
    team_guid "MyString"
    quiz_event_id 1
  end
end
