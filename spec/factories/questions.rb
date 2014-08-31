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
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    visible_text        'MyString'
    correct_answer_id   1
    created_by          1
    updated_by          nil
    publicly_visible    true
    approved_by         1
  end
end
