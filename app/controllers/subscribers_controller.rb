class SubscribersController < ApplicationController
  def create
    @subscriber = Subscriber.new(permitted_params)

    if @subscriber.valid? && subscribe_to_active_campaign(@subscriber)
      @subscriber = Subscriber.new # empty fields on form
      @message = I18n.t('subscriber.success')
      render :success
    else
      @message = I18n.t('subscriber.failure')
      render :error
    end
  end

  private

  def subscribe_to_active_campaign(subscriber)
    name = subscriber.name
    email = subscriber.email

    if Rails.env.production?
      query = JSON.parse(Campaign.contact_add(email: email,
        first_name: name, 'p[2]' => 2, 'status[2]' => 1,
        tags: 'blog,modal,canvas,sw'))
    else
      query = JSON.parse(Campaign.contact_add(email: email,
      first_name: name, 'p[1]' => 1, 'status[1]' => 1,
      tags: 'blog,modal,canvas,sw'))
    end

    query['result_code'] == 1 # return true or false, code 1 is for successful requests
  end

  def permitted_params
    params.require(:subscriber).permit(:name, :email)
  end
end
