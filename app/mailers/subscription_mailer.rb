class SubscriptionMailer < ApplicationMailer
  def lesson(user)
    @user = user
    @newsletter = Newsletter.find(user.current_newsletter)

    mail to: @user.email, subject: @newsletter.subject
  end
end
