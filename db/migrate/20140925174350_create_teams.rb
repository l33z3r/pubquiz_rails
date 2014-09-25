class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :quiz_event_id, index: true

      t.timestamps
    end
  end
end
