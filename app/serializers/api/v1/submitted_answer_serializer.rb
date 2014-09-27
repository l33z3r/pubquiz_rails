class Api::V1::SubmittedAnswerSerializer < ActiveModel::Serializer
  
  attributes :id, :event_team_member_id, :user_id, :team_id, :quiz_event_id, :quiz_round_question_id, :question_answer_id, :points_scored, :question_asked_at, :question_answered_at

end