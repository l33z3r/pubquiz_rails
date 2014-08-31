# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :quiz_event do
    name "MyString"
    description "MyText"
    time_zone "MyString"
    starts_at "2014-08-30 23:33:12"
    venue_id 1
    created_by 1
    updated_by 1
    event_guid "MyString"
    sponsor_logo_url "MyString"
  end
end
