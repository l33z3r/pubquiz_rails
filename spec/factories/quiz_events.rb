# == Schema Information
#
# Table name: quiz_events
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  description        :text
#  time_zone          :string(255)
#  starts_at          :datetime
#  venue_id           :integer
#  created_by         :integer
#  updated_by         :integer
#  event_guid         :string(255)
#  sponsor_logo_url   :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  logo_file_name     :string(255)
#  logo_content_type  :string(255)
#  logo_file_size     :integer
#  logo_updated_at    :datetime
#  open_to_the_public :boolean
#

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
