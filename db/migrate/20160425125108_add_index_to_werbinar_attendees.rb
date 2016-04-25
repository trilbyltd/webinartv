class AddIndexToWerbinarAttendees < ActiveRecord::Migration
  def change
    add_index :webinar_attendees, :webinar_id
    add_index :webinar_attendees, :attendee_id
    add_index :webinar_attendees, [:webinar_id, :attendee_id], unique: true
  end
end
