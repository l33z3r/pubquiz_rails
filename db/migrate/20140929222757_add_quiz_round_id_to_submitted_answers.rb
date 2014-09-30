class AddQuizRoundIdToSubmittedAnswers < ActiveRecord::Migration
  def change
    add_column :submitted_answers, :quiz_round_id, :integer, index: true
  end
end
