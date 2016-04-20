class WebinarAttendee < ActiveRecord::Base
  # has_and_belongs_to_many :attendees, join_table: "webinar_attendees", foreign_key: "attendee_id"
  # has_and_belongs_to_many :webinars, join_table: "webinar_attendees", foreign_key:  "webinar_id"
  belongs_to :webinar
  belongs_to :attendee

  validates_presence_of :webinar_id
  validates_presence_of :attendee_id

  def attended!
    self.update!(attended: true)
  end
end
