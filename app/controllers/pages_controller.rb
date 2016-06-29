class PagesController < ApplicationController
  def home
    @contact = Contact.new
  end

  def works
    @contact = Contact.new
  end

  def contact
    @contact = Contact.new(permitted_params)

    if @contact.valid?
      ContactMailer.contact(@contact).deliver_now
      @contact = Contact.new # empty fields on form
      @message = I18n.t('contact.success')
    else
      @message = I18n.t('contact.failure')
    end

    render :contact
  end

  def services
    @contact = Contact.new
  end

  def mvp
    @contact = Contact.new
  end

  private

  def permitted_params
    params.require(:contact).permit(:name, :email, :budget, :message)
  end
end
