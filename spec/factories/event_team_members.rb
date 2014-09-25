# == Schema Information
#
# Table name: event_team_members
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  team_id         :integer
#  referral_from   :string(255)
#  device_platform :string(255)
#  device_type     :string(255)
#  tablet          :boolean
#  phone           :boolean
#  pc              :boolean
#  app_version_id  :integer
#  created_at      :datetime
#  updated_at      :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event_team_member do
    user_id 1
    team_id 1
    referral_from "MyString"
    device_platform "MyString"
    device_type "MyString"
    tablet false
    phone false
    pc false
    app_version_id 1
  end
end
