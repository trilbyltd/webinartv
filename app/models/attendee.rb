class Attendee < ActiveRecord::Base
  has_many :webinars, through: :webinar_attendees
  has_many :webinar_attendees, dependent: :destroy
  accepts_nested_attributes_for :webinar_attendees

  validates :name, presence: { message: 'Please provide your name' }
  validates :email, presence: { message: 'Please supply your email address so we can send you the webinar information.' }
  validates :email, email: { message: 'Email doesn\'t appear to be valid' }
  validates :school_name, presence: { message: 'Please let us know where you\'re from' }
  validates :contact_number, presence: { message: 'We may need to call you about the webinar' }

  default_scope { order('name asc') }

  def register(webinar)
    webinar_attendees.create(webinar_id: webinar.id, attendee_id: id)
  end

  def registered?(webinar)
    WebinarAttendee.where(webinar_id: webinar.id, attendee_id: id).present?
  end

  def register_and_email(webinar)
    self.register(webinar)
    WebinarMailerJob.perform_now(self, webinar)
  end

  def attended(webinar)
    WebinarAttendee.where(webinar_id: webinar.id, attendee_id: id).first.update!(attended: true)
  end

  def attended?(webinar)
    WebinarAttendee.where(webinar_id: webinar.id, attendee_id: id).take.attended?
  end
end
