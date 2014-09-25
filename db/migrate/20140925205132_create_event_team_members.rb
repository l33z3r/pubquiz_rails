class CreateEventTeamMembers < ActiveRecord::Migration
  def change
    create_table :event_team_members do |t|
      t.integer :user_id, index: true
      t.integer :team_id, index: true
      t.string :referral_from
      t.string :device_platform
      t.string :device_type
      t.boolean :tablet
      t.boolean :phone
      t.boolean :pc
      t.integer :app_version_id

      t.timestamps
    end
  end
end
