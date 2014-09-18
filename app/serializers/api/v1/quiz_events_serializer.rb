class Api::V1::QuizEventsSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :time_zone, :starts_at, :event_guid, :logo_url, :open_to_the_public

  def starts_at
    object.starts_at.to_i
  end

  def logo_url
    object.logo.try(:url)
  end

end
