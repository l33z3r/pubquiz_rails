# == Schema Information
#
# Table name: question_answers
#
#  id                 :integer          not null, primary key
#  question_id        :integer
#  visible_text       :string(255)
#  sorting_order      :integer
#  created_at         :datetime
#  updated_at         :datetime
#  image_file_name    :string(255)
#  image_content_type :string(255)
#  image_file_size    :integer
#  image_updated_at   :datetime
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question_answer do
    question_id 1
    visible_text "MyString"
    sorting_order 1
  end
end
