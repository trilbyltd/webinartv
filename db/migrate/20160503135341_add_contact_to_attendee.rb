class AddContactToAttendee < ActiveRecord::Migration
  def change
    add_column :attendees, :contact_number, :string, default: ""
    add_column :attendees, :notes, :text, default: ""
  end
end
