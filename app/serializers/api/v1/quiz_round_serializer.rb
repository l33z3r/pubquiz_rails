class Api::V1::QuizRoundSerializer < ActiveModel::Serializer

  embed :ids, include: true

  attributes :id, :sorting_order, :name, :quiz_round_questions

end
