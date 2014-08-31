class CreateQuizEvents < ActiveRecord::Migration
  def change
    create_table :quiz_events do |t|
      t.string :name
      t.text :description
      t.string :time_zone
      t.datetime :starts_at, index: true
      t.integer :venue_id, index: true
      t.integer :created_by, index: true
      t.integer :updated_by, index: true
      t.string :event_guid, index: true
      t.string :sponsor_logo_url

      t.timestamps
    end
  end
end
