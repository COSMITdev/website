class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@cosmit.me"
  layout 'mailer'
end
