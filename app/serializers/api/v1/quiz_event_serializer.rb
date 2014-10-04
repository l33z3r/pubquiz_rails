class Api::V1::QuizEventSerializer < ActiveModel::Serializer

  embed :ids, include: true

  attributes :id, :name, :description, :time_zone, :starts_at, :logo_url,
             :open_to_the_public, :in_dst, :venue_id

  #lee had to comment this out to get it working
  # has_many :quiz_rounds, serializer: Api::V1::QuizRoundsSerializer

  def starts_at
    object.starts_at.to_i
  end

  def logo_url
    # logo of the sponsor
    object.logo.try(:url)
  end

end
