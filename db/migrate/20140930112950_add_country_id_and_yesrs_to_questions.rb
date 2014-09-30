class AddCountryIdAndYesrsToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :country_id, :integer, index: true
    add_column :questions, :year_from, :integer, index: true
    add_column :questions, :year_to, :integer, index: true
  end
end
