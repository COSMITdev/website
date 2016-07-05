class SubscriptionsController < ApplicationController
  def index
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.new(permitted_params)

    if @subscription.save
      SubscriptionMailer.lesson(@subscription).deliver_now if Newsletter.find(@subscription.current_newsletter)
      @subscription = Subscription.new # empty fields on form
      @message = I18n.t('subscription.success')
    else
      @message = I18n.t('subscription.failure')
    end

    render :subscription
  end

  def destroy
    @subscription = Subscription.find_by(email: params[:subscription][:email])
    @success, @error = false, false
    if params[:subscription][:email].present?
      if @subscription.present? && @subscription.destroy
        @message = I18n.t('subscription.destroy.success')
        @success = true
      elsif @subscription.nil?
        @message = I18n.t('subscription.destroy.not_found')
        @error = true
      else
        @message = I18n.t('subscription.destroy.failure')
        @error = true
      end
    else
      @message = I18n.t('subscription.destroy.empty_email')
      @error = true
    end

    render :destroy
  end

  def unsubscribe;end

  def next
    if params[:email].present?
      subscriber = Subscription.find_by(email: params[:email])
      if Newsletter.where(id: subscriber.current_newsletter).any?
        SubscriptionMailer.lesson(subscriber).deliver_now
        subscriber.update_attributes(current_newsletter: subscriber.current_newsletter+1)
        @message = t('subscription.next_lesson.success')
      else
        @message = t('subscription.next_lesson.not_found')
      end
    else
      @message = t('subscription.next_lesson.provide_email')
    end
  end

  private

  def permitted_params
    params.require(:subscription).permit(:name, :email)
  end
end
