class Attendee < ActiveRecord::Base
has_and_belongs_to_many :webinars, through: :webinar_attendees

default_scope { order('name asc') }
end
