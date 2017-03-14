class NewsletterController < ApplicationController
  def create
    @newsletter = Newsletter.new(permitted_params)

    if @newsletter.valid?
      @newsletter = Newsletter.new # empty fields on form
      @message = I18n.t('newsletter.success')
      render :success
    else
      @message = I18n.t('newsletter.failure')
      render :error
    end
  end

  private

  def permitted_params
    params.require(:newsletter).permit(:name, :email)
  end
end
