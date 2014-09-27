class Api::V1::UserSerializer < ActiveModel::Serializer

  attributes :id, :name, :email, :event_team_member_id

end