class PagesController < ApplicationController
  def home
  end

  def contact
    @contact = Contact.new
  end

  def send_contact
    @contact = Contact.new(permitted_params)
    if @contact.valid?
      ContactMailer.contact(@contact).deliver_now
      redirect_to contato_path, notice: 'Contato enviado com sucesso!'
    else
      render :contact
    end
  end

  private

  def permitted_params
    params.require(:contact).permit(:name, :email, :subject, :message)
  end
end
