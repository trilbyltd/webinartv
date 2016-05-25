class AddDefaultFalseToWebinarAttendee < ActiveRecord::Migration
  def change
    change_column_null :webinar_attendees, :attended, false
    change_column_default :webinar_attendees, :attended, false
  end
end
