class CreateQuizRoundQuestions < ActiveRecord::Migration
  def change
    create_table :quiz_round_questions do |t|
      t.integer :quiz_round_id, index: true
      t.integer :question_id, index: true
      t.integer :sorting_order, index: true
      t.integer :time_limit_in_seconds
      t.integer :points_for_correct_answer
      t.integer :points_for_wrong_answer
      t.integer :points_for_no_answer

      t.timestamps
    end
  end
end
