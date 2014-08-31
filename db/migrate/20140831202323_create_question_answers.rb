class CreateQuestionAnswers < ActiveRecord::Migration
  def change
    create_table :question_answers do |t|
      t.integer :question_id, index: true
      t.string :visible_text
      t.integer :sorting_order, index: true

      t.timestamps
    end
    add_attachment :question_answers, :image
  end
end
