class Api::V1::EventTeamMemberSerializer < ActiveModel::Serializer

  attributes :id, :team_id, :user_id, :quiz_event_id# todo , :backgrounded

  has_many :submitted_answers, serializer: Api::V1::SubmittedAnswersController

end