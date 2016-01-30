class ContactMailer < ApplicationMailer
  def contact(contact)
    @name = contact.name
    @email = contact.email
    @budget = contact.budget
    @message = contact.message

    mail from: @email, to: "contato@cosmit.me", subject: "Uhaa, mais um peixe na rede!"
  end
end
