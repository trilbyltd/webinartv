# frozen_string_literal: true
class WebinarRegistrationJob < ActiveJob::Base
  queue_as :mailers

  def perform(attendee, webinar)
    WebinarMailer.webinar_registration(attendee, webinar).deliver_now
    WebinarMailer.internal_join_notification(attendee, webinar).deliver_now
  end
end
