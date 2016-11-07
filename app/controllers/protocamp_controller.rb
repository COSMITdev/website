class ProtocampController < ApplicationController
  def index
    @protocamp = Protocamp.new
  end

  def create
    @protocamp = Protocamp.new(permitted_params)

    subscribe_to_active_campaign(@protocamp, 'protocamp,sl') if @protocamp.valid?

    render :create
  end

  def canvas
    @canvas = Protocamp.new(permitted_params)
    # Used for facebook/twitter share buttons
    @post = Post.friendly.find request.referer.split('/').last

    if @canvas.valid?
      subscribe_to_active_campaign(@canvas, 'blog,canvas,sw')
      @canvas = Protocamp.new # empty fields on form
      @message = I18n.t('canvas.success')
    else
      @message = I18n.t('canvas.failure')
    end

    render :canvas
  end

  private

  def subscribe_to_active_campaign(user, tags)
    name = user.name
    email = user.email

    if Rails.env.production?
      query = JSON.parse(Campaign.contact_sync(email: email,
        first_name: name, 'p[2]' => 2, 'status[2]' => 1, tags: tags))
    else
      query = JSON.parse(Campaign.contact_sync(email: email,
        first_name: name, 'p[1]' => 1, 'status[1]' => 1, tags: tags))
    end

    query['result_code'] == 1 # return true or false, code 1 is for successful requests
  end

  def permitted_params
    params.require(:protocamp).permit(:name, :email)
  end
end
