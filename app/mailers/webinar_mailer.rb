class WebinarMailer < ApplicationMailer

  def webinar_registration(attendee, webinar)
    @attendee = attendee
    @webinar = webinar
    mail(
      to: "#{@attendee.name} <#{@attendee.email}>",
      subject: "Your Webinar Registration: #{@webinar.title}"
      )
  end

end

