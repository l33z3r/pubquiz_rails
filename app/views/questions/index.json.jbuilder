json.array!(@questions) do |question|
  json.extract! question, :id, :visible_text, :correct_answer_id, :created_by, :updated_by, :publicly_visible, :approved_by
  json.url question_url(question, format: :json)
end
