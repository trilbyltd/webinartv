class ChangeWebinarNulls < ActiveRecord::Migration
  def change
    change_column :webinars, :description, :text, null: true
    change_column :webinars, :live_date, :datetime, null: false
    change_column :webinars, :title, :string, null: false

    change_column :attendees, :name, :string, null: false
    change_column :attendees, :email, :string, null: false

    change_column :webinar_attendees, :webinar_id, :integer, null: false
    change_column :webinar_attendees, :attendee_id, :integer, null: false
  end
end
