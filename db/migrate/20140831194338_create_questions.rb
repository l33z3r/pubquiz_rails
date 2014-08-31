class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :question_category_id, index: true
      t.string :visible_text
      t.integer :correct_answer_id
      t.integer :created_by, index: true
      t.integer :updated_by
      t.boolean :publicly_visible, index: true
      t.integer :approved_by, index: true

      t.timestamps
    end
    add_attachment :questions, :image
  end
end
