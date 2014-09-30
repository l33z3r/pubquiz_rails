# == Schema Information
#
# Table name: questions
#
#  id                   :integer          not null, primary key
#  question_category_id :integer
#  visible_text         :string(255)
#  correct_answer_id    :integer
#  created_by           :integer
#  updated_by           :integer
#  publicly_visible     :boolean
#  approved_by          :integer
#  created_at           :datetime
#  updated_at           :datetime
#  image_file_name      :string(255)
#  image_content_type   :string(255)
#  image_file_size      :integer
#  image_updated_at     :datetime
#  country_id           :integer
#  year_from            :integer
#  year_to              :integer
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    question_category_id 1
    visible_text         'MyString'
    created_by           1
    correct_answer_id    1
    publicly_visible     true
    approved_by          1
  end
end
