class CreateWebinarAttendees < ActiveRecord::Migration
  def change
    create_table :webinar_attendees do |t|
      t.references :webinar, index: true, foreign_key: true
      t.references :attendee, index: true, foreign_key: true
      t.boolean :attended

      t.timestamps null: false
    end
  end
end
