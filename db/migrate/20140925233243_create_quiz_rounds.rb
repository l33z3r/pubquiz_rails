class CreateQuizRounds < ActiveRecord::Migration
  def change
    create_table :quiz_rounds do |t|
      t.integer :quiz_event_id, index: true
      t.string :name
      t.integer :created_by, index: true
      t.integer :updated_by, index: true
      t.integer :question_category_id, index: true
      t.integer :sorting_order, index: true

      t.timestamps
    end
  end
end
