# == Schema Information
#
# Table name: venues
#
#  id                :integer          not null, primary key
#  public_title      :string(255)
#  address           :text
#  latitude          :float(24)
#  longitude         :float(24)
#  created_by        :integer
#  updated_by        :integer
#  publicly_visible  :boolean
#  approved_by       :integer
#  time_zone         :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  logo_file_name    :string(255)
#  logo_content_type :string(255)
#  logo_file_size    :integer
#  logo_updated_at   :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :venue do
    public_title "MyString"
    address "MyText"
    latitude 1.5
    longitude 1.5
    created_by 1
    updated_by 1
    publicly_visible false
    approved_by 1
    time_zone "MyString"
  end
end
