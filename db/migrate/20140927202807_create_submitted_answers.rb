class CreateSubmittedAnswers < ActiveRecord::Migration
  def change
    create_table :submitted_answers do |t|
      t.integer :user_id, index: true
      t.integer :team_id, index: true
      t.integer :quiz_event_id, index: true
      t.integer :quiz_round_question_id, index: true
      t.integer :question_answer_id, index: true
      t.boolean :correct
      t.integer :points_scored
      t.datetime :question_asked_at
      t.datetime :question_answered_at

      t.timestamps
    end
  end
end
