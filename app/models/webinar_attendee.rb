class WebinarAttendee < ActiveRecord::Base
  belongs_to :webinar
  belongs_to :attendee

  validates_presence_of :webinar_id
  validates_presence_of :attendee_id


  def attended!
    self.update!(attended: true)
  end

  def registered?(webinar, attendee)
    return false if WebinarAttendee.find(webinar_id: webinar.id ,attendee_id: attendee.id ).empty?
  end
end
