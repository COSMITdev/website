class SubscriptionsController < ApplicationController
  def index
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.new(permitted_params)

    if @subscription.save
      # SubscriptionMailer.subscription(@subscription).deliver_now
      @subscription = Subscription.new # empty fields on form
      @message = I18n.t('subscription.success')
    else
      @message = I18n.t('subscription.failure')
    end

    render :subscription
  end

  def destroy
    @subscription = Subscription.find_by(email: params[:email])

    if @subscription.destroy
      # SubscriptionMailer.subscription(@subscription).deliver_now
      @message = I18n.t('subscription.destroy.success')
    else
      @message = I18n.t('subscription.destroy.failure')
    end

    render :destroy
  end

  private

  def permitted_params
    params.require(:subscription).permit(:name, :email)
  end
end
