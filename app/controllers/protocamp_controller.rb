class ProtocampController < ApplicationController
  def index
    @protocamp = Protocamp.new
  end

  def create
    @protocamp = Protocamp.new(permitted_params)
    render :create
  end

  def canvas
    @canvas = Protocamp.new(permitted_params)
    # Used for facebook/twitter share buttons
    @post = Post.friendly.find request.referer.split('/').last

    if @canvas.valid?
      @canvas = Protocamp.new # empty fields on form
      @message = I18n.t('canvas.success')
    else
      @message = I18n.t('canvas.failure')
    end

    render :canvas
  end

  private

  def permitted_params
    params.require(:protocamp).permit(:name, :email)
  end
end
