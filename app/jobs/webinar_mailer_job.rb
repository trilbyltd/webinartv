class WebinarMailerJob < ActiveJob::Base
  queue_as :mailer

  def perform(attendee, webinar)
    WebinarMailer.webinar_registration(attendee, webinar).deliver_now
    WebinarMailer.internal_join_notification(attendee, webinar).deliver_now
  end
end
