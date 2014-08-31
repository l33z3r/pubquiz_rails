json.array!(@question_categories) do |question_category|
  json.extract! question_category, :id, :name, :question_category_id, :active, :created_by, :updated_by, :country_id
  json.url question_category_url(question_category, format: :json)
end
