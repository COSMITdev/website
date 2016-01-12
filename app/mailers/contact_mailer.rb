class ContactMailer < ApplicationMailer
  def contact(contact)
    @name = contact.name
    @email = contact.email
    @subject = contact.subject
    @message = contact.message

    mail from: @email, to: "contato@cosmit.com.br", subject: @subject
  end
end
