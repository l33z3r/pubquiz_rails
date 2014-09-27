class Api::V1::QuizRoundsSerializer < ActiveModel::Serializer

  embed :ids, include: true

  attributes :id, :sorting_order, :name, :quiz_round_questions

end
