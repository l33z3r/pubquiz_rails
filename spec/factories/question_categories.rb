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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question_category do
    sequence(:name)       { |x| "MyString #{x}" }
    question_category_id  nil
    active                nil
    created_by            1
    updated_by            nil
    country_id            1
  end
end
