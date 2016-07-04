class SubscriptionsController < ApplicationController
  def index
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.new(permitted_params)

    if @subscription.save
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

  private

  def permitted_params
    params.require(:subscription).permit(:name, :email)
  end
end
