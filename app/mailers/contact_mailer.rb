class ContactMailer < ApplicationMailer
  def contact(contact)
    @name = contact.name
    @email = contact.email
    @budget = contact.budget
    @message = contact.message

    mail from: @email, to: "contato@cosmit.com.br", subject: "Orçamento para #{@name}"
  end
end
