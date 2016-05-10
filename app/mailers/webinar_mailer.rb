class WebinarMailer < ApplicationMailer

  def webinar_registration(attendee, webinar)
    @attendee = attendee
    @webinar = webinar
    attachments.inline['TTV_logo.png'] = File.read('app/assets/images/email/TTV_logo.png')
    attachments.inline['twitter.png'] = File.read('app/assets/images/email/twitter_icon.png')
    mail(
      to: "#{@attendee.name} <#{@attendee.email}>",
      bcc: ENV.fetch("CRM_EMAIL"),
      subject: "Your Webinar Registration: #{@webinar.title}"
      )
  end

end

