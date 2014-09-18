class CreateCurrencies < ActiveRecord::Migration
  def change
    create_table :currencies do |t|
      t.string :name, index: true
      t.string :iso_code, index: true
      t.string :leading_symbol
      t.string :trailing_symbol
      t.string :thousands_separator
      t.string :decimal_separator
      t.integer :sorting_order, index: true
      t.boolean :active, index: true

      t.timestamps
    end
  end
end
