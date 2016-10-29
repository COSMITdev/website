class SubscribersController < ApplicationController
  def create
    @subscriber = Subscriber.new(permitted_params)
    # Used for facebook/twitter share buttons
    @post = Post.friendly.find request.referer.split('/').last

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
      query = JSON.parse(Campaign.contact_sync(email: email,
        first_name: name, 'p[2]' => 2, 'status[2]' => 1,
        tags: 'blog,canvas,sw'))
    else
      query = JSON.parse(Campaign.contact_sync(email: email,
        first_name: name, 'p[1]' => 1, 'status[1]' => 1,
        tags: 'blog,canvas,sw'))
    end

    query['result_code'] == 1 # return true or false, code 1 is for successful requests
  end

  def permitted_params
    params.require(:subscriber).permit(:name, :email)
  end
end
