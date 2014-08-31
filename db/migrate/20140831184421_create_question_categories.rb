class CreateQuestionCategories < ActiveRecord::Migration
  def change
    create_table :question_categories do |t|
      t.string :name, index: true
      t.integer :question_category_id, index: true
      t.boolean :active, index: true
      t.integer :created_by
      t.integer :updated_by
      t.integer :country_id

      t.timestamps
    end
  end
end
