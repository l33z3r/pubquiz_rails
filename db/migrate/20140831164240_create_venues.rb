class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :public_title, index: true
      t.text :address
      t.float :latitude, index: true
      t.float :longitude, index: true
      t.integer :created_by, index: true
      t.integer :updated_by
      t.boolean :publicly_visible
      t.integer :approved_by
      t.string :time_zone

      t.timestamps
    end
  end
end
