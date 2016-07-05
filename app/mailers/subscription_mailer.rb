class SubscriptionMailer < ApplicationMailer
  def lesson(subscriber)
    @subscriber = subscriber
    @newsletter = Newsletter.find(subscriber.current_newsletter)

    mail to: @subscriber.email, subject: @newsletter.subject
  end
end
