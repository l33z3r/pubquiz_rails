class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name, index: true
      t.boolean :in_the_eu, index: true
      t.integer :currency_id, index: true
      t.integer :sorting_order, index: true

      t.timestamps
    end
  end
end
