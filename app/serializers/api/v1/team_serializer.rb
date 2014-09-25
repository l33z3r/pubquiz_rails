class Api::V1::TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :quiz_event_id, :event_team_members, :users

  def event_team_members
    object.event_team_members.map {|m| { user_id: m.user_id, team_id: m.team_id}}
    # OR ########
    # object.event_team_members.map(&:user_id)
  end

  def users
    object.event_team_members.map {|m| {id: m.user_id, name: m.user.name} }
  end
end
