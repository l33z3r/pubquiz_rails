class Api::V1::QuestionAnswerSerializer < ActiveModel::Serializer

  embed :ids, include: true

  attributes :id, :question_id, :sorting_order, :visible_text, :url

  def url
    object.image.try(:url)
  end

end