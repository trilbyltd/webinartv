class CreateWebinarAttendees < ActiveRecord::Migration
  def change
    create_table :webinar_attendees do |t|
      t.integer :webinar_id
      t.integer :attendee_id
      t.boolean :attended

      t.timestamps null: false
    end
  end
end
