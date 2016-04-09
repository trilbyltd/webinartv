class Attendee < ActiveRecord::Base
has_many :webinars, through: :webinar_attendees

default_scope { order('name asc') }
end
