class Api::V1::TeamsSerializer < ActiveModel::Serializer
  attributes :id, :name, :quiz_event_id
end
