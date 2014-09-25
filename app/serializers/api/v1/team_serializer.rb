class Api::V1::TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :quiz_event_id, :event_team_members

  def event_team_members
    [1,2,3] # todo
  end
end
