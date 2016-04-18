class WebinarAttendee < ActiveRecord::Base
  # has_and_belongs_to_many :attendees, join_table: "webinar_attendees", foreign_key: "attendee_id"
  # has_and_belongs_to_many :webinars, join_table: "webinar_attendees", foreign_key:  "webinar_id"
  belongs_to :webinar
  belongs_to :attendee

end
