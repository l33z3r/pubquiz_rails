class Api::V1::QuizRoundsSerializer < ActiveModel::Serializer

  embed :ids, include: true

  attributes :id, :sorting_order, :name

  has_many :quiz_round_questions, each_serializer: Api::V1::QuizRoundQuestionSerializer

end
