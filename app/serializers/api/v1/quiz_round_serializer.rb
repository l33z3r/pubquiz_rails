class Api::V1::QuizRoundSerializer < ActiveModel::Serializer

  embed :ids, include: true

  attributes :id, :sorting_order, :name

  has_many :quiz_round_questions, serializer: Api::V1::QuizRoundQuestionSerializer

end
