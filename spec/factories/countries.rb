# == Schema Information
#
# Table name: countries
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  in_the_eu     :boolean
#  currency_id   :integer
#  sorting_order :integer
#  created_at    :datetime
#  updated_at    :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :country do
    sequence(:name)   { |n| "MyString #{n}" }
    in_the_eu         true
    currency_id       1
  end

  factory :ireland, class: Country do
    name             'ireland'
    in_the_eu        true
    currency_id      1
  end
end
