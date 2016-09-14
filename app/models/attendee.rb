# frozen_string_literal: true
class Attendee < ActiveRecord::Base
  has_many :webinars, through: :webinar_attendees
  has_many :webinar_attendees, dependent: :destroy
  accepts_nested_attributes_for :webinar_attendees

  validates :name, presence: { message: 'Please provide your name' }
  validates :email, presence: { message: 'Please supply your email address so we can send you the webinar information.' }
  validates :email, email: { message: 'Email doesn\'t appear to be valid' }
  validates :school_name, presence: { message: 'Please let us know where you\'re from' }
  validates :contact_number, length: { maximum: 20 }

  default_scope { order('name asc') }

  def to_s
    name
  end

  def register(webinar)
    webinar_attendees.create(webinar: webinar, attendee: self, attended: false)
  end

  def registered?(webinar)
    WebinarAttendee.where(webinar: webinar, attendee: self).present?
  end

  def register_and_email(webinar)
    register(webinar)
    # WebinarRegistrationJob.perform_later(self, webinar)
    WebinarMailer.webinar_registration(self, webinar).deliver_now
    WebinarMailer.internal_join_notification(self, webinar).deliver_now
  end

  def webinar_attendance(webinar)
    WebinarAttendee.where(webinar: webinar, attendee: self).first.attended?
  end

  def attended(webinar)
    WebinarAttendee.where(webinar: webinar, attendee: self).first.update!(attended: true)
  end

  def attended?(webinar)
    WebinarAttendee.where(webinar: webinar, attendee: self).take.attended?
  end
end
