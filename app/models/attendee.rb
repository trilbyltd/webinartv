class Attendee < ActiveRecord::Base
  # has_and_belongs_to_many :webinars, :join_table => "webinar_attendees"
  has_many :webinars, through: :webinar_attendees
  has_many :webinar_attendees, dependent: :destroy
  default_scope { order('name asc') }
  
end
