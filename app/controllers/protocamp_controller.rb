class ProtocampController < ApplicationController
  def index
    @protocamp = Protocamp.new
  end

  def create
    @protocamp = Protocamp.new(permitted_params)

    if @protocamp.valid?
      subscribe_to_active_campaign(@protocamp)
      render :success
    else
      render :error
    end
  end

  private

  def subscribe_to_active_campaign(protocamp)
    name = protocamp.name
    email = protocamp.email

    if Rails.env.production?
      query = JSON.parse(Campaign.contact_sync(email: email,
        first_name: name, 'p[2]' => 2, 'status[2]' => 1,
        tags: "protocamp,sl"))
    else
      query = JSON.parse(Campaign.contact_sync(email: email,
        first_name: name, 'p[1]' => 1, 'status[1]' => 1,
        tags: "protocamp,sl"))
    end

    query['result_code'] == 1 # return true or false, code 1 is for successful requests
  end

  def permitted_params
    params.require(:protocamp).permit(:name, :email)
  end
end
