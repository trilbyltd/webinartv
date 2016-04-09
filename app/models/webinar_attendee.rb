class WebinarAttendee < ActiveRecord::Base
belongs_to :attendees
belongs_to :webinars
end
