class ContactMailer < ApplicationMailer
  def contact(contact)
    @name = contact.name
    @email = contact.email
    @budget = contact.budget
    @message = contact.message

    destiny = I18n.locale == :'pt-BR' ? "contato@cosmit.me" : "hi@cosmit.me"

    mail from: @email, to: destiny, subject: "Uhaa, mais um peixe na rede!"
  end
end
