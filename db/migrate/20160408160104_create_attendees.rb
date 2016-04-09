class CreateAttendees < ActiveRecord::Migration
  def change
    create_table :attendees do |t|
      t.string :name
      t.string :email
      t.boolean :active_user
      t.string :school_name

      t.timestamps null: false
    end
  end
end
