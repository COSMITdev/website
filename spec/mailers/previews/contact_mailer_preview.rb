# Preview all emails at http://localhost:3000/rails/mailers/contact
class ContactPreview < ActionMailer::Preview
  def contact
    name = "Nome Teste"
    email = "teste@test.com"
    subject = "ASSUNTO"
    message = "Lorem ipsum dolor sit amet"
    ContactMailer.contact(Contact.new(name: name, email: email, subject: subject, message: message))
  end
end
