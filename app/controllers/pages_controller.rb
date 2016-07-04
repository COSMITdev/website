class PagesController < ApplicationController
  def home
    @contact = Contact.new
  end

  def works
    @contact = Contact.new
  end

  def contact
    @contact = Contact.new(contact_permitted_params)

    if @contact.valid?
      ContactMailer.contact(@contact).deliver_now
      @contact = Contact.new # empty fields on form
      @message = I18n.t('contact.success')
    else
      @message = I18n.t('contact.failure')
    end

    render :contact
  end

  def services
    @contact = Contact.new
  end

  def mvp
    @contact = Contact.new
  end

  def course
    @subscription = Subscription.new
  end

  def subscription
    @subscription = Subscription.new(subscription_permitted_params)

    if @subscription.save
      # SubscriptionMailer.subscription(@subscription).deliver_now
      @subscription = Subscription.new # empty fields on form
      @message = I18n.t('subscription.success')
    else
      @message = I18n.t('subscription.failure')
    end

    render :subscription
  end

  private

  def contact_permitted_params
    params.require(:contact).permit(:name, :email, :budget, :message)
  end

  def subscription_permitted_params
    params.require(:subscription).permit(:name, :email)
  end
end
