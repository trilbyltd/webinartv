class AddIndexToAttendees < ActiveRecord::Migration
  def change
    add_index :attendees, :email, unique: true
  end
end
