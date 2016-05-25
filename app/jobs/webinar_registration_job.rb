class WebinarRegistrationJob < ActiveJob::Base
  queue_as :mailers

  def perform(attendee, webinar)
    WebinarMailer.webinar_registration(attendee, webinar).deliver_later
    WebinarMailer.internal_join_notification(attendee, webinar).deliver_later
  end
end
