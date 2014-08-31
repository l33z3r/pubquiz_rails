class AdLogosToEventsAndVenues < ActiveRecord::Migration
  def up
    add_attachment :quiz_events, :logo
    add_attachment :venues, :logo
  end

  def down
    remove_attachment :quiz_events, :logo
    remove_attachment :venues, :logo
  end
end
