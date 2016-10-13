class NewsletterController < ApplicationController
  def create
    @newsletter = Newsletter.new(permitted_params)

    if @newsletter.valid? && subscribe_to_active_campaign(@newsletter)
      @newsletter = Newsletter.new # empty fields on form
      @message = I18n.t('newsletter.success')
      render :success
    else
      @message = I18n.t('newsletter.failure')
      render :error
    end
  end

  private

  def subscribe_to_active_campaign(newsletter)
    name = newsletter.name
    email = newsletter.email

    if Rails.env.production?
      query = JSON.parse(Campaign.contact_sync(email: email,
        first_name: name, 'p[2]' => 2, 'status[2]' => 1,
        tags: 'blog,newsletter,sw'))
    else
      query = JSON.parse(Campaign.contact_sync(email: email,
        first_name: name, 'p[1]' => 1, 'status[1]' => 1,
        tags: 'blog,newsletter,sw'))
    end

    query['result_code'] == 1 # return true or false, code 1 is for successful requests
  end

  def permitted_params
    params.require(:newsletter).permit(:name, :email)
  end
end
