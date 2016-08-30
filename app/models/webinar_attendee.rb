class WebinarAttendee < ActiveRecord::Base
  belongs_to :webinar
  belongs_to :attendee

  validates_presence_of :webinar_id
  validates_presence_of :attendee_id

  validates_uniqueness_of :attendee_id, scope: :webinar_id

  def attended!
    update!(attended: true)
  end

  def registered?(webinar, attendee)
    return false if WebinarAttendee.find(webinar: webinar, attendee: attendee).empty?
  end
end
