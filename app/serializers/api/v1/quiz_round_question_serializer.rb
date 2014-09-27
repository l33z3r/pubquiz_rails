class Api::V1::QuizRoundQuestionSerializer < ActiveModel::Serializer

  embed :ids, include: true

  attributes :id, :question_id, :quiz_round_id, :sorting_order,
             :time_limit_in_seconds, :points_for_correct_answer,
             :points_for_wrong_answer, :points_for_no_answer,
             :visible_text

  has_many :question_answers, each_serializer: Api::V1::QuestionAnswerSerializer

  def visible_text
    object.question.visible_text
  end

end
