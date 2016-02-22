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
    end

    render :contact
  end

  private

  def permitted_params
    params.require(:contact).permit(:name, :email, :budget, :message)
  end
end
