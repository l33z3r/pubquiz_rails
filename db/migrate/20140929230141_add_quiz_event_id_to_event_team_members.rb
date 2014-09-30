class AddQuizEventIdToEventTeamMembers < ActiveRecord::Migration
  def change
    add_column :event_team_members, :quiz_event_id, :integer, index: true
  end
end
