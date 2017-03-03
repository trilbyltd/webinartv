# frozen_string_literal: true
class WebinarMailer < ApplicationMailer
  def webinar_registration(attendee, webinar)
    @attendee = attendee
    @webinar = webinar
    attachments.inline['TTV_logo.png'] = File.read('app/assets/images/email/TTV_logo.png')
    attachments.inline['twitter.png'] = File.read('app/assets/images/email/twitter_icon.png')
    attachments['event.ics'] = { mime_type: 'application/ics', content: @webinar.to_ics }
    mail(
      to: "#{@attendee.name} <#{@attendee.email}>",
      subject: "Your TrilbyTV Webinar: #{@webinar.title}"
    )
  end

  def internal_join_notification(attendee, webinar)
    @attendee = attendee
    @webinar = webinar
    attachments.inline['TTV_logo.png'] = File.read('app/assets/images/email/TTV_logo.png')
    attachments.inline['twitter.png'] = File.read('app/assets/images/email/twitter_icon.png')
    mail(
      to: ENV['INTERNAL_EMAIL'],
      cc: @webinar.presenter.email,
      subject: "Webinar Registration: #{@webinar.title} (#{l(webinar.live_date, format: :short)})"
    )
  end
end
