namespace :subscription do
  desc "This daily task send every day the next Lesson/Newsletter to Subscribers"
  task daily: :environment do
    Subscription.find_each do |subscriber|
      if Newsletter.find(subscriber.current_newsletter)
        SubscriptionMailer.lesson(subscriber).deliver_now
        subscriber.update_attributes(current_newsletter: subscriber.current_newsletter+1)
      end
    end
  end
end
