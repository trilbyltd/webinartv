class ApplicationMailer < ActionMailer::Base
  default from: ENV.fetch("SMTP_FROM")
  layout 'mailer'
end
