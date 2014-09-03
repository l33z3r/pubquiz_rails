class AddOpenToThePublicToQuizEvents < ActiveRecord::Migration
  def change
    add_column :quiz_events, :open_to_the_public, :boolean, index: true
  end
end
