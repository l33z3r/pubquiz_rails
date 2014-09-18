# == Schema Information
#
# Table name: currencies
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  iso_code            :string(255)
#  leading_symbol      :string(255)
#  trailing_symbol     :string(255)
#  thousands_separator :string(255)
#  decimal_separator   :string(255)
#  sorting_order       :integer
#  active              :boolean
#  created_at          :datetime
#  updated_at          :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :currency do
    sequence(:name)           { |n| "Currency #{n}" }
    sequence(:iso_code)       { |n| "EU#{n}" }
    leading_symbol            '€'
    trailing_symbol           'c'
    thousands_separator       ','
    decimal_separator         '.'
    active                    true
    sorting_order             { rand(9999) }
  end
end
