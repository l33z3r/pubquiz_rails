class AddEventStatusToQuizEvents < ActiveRecord::Migration
  def change
    add_column :quiz_events, :event_status, :string, index: true
  end
end
