# Preview all emails at http://localhost:3000/rails/mailers/user_mailer

class UserMailerPreview < ActionMailer::Preview
  def contact_form
    UserMailer.contact_form("john@example.com", "John", "Hello New Peeps!")
  end

  def welcome_message
    UserMailer.welcome_mail("jj@g.com", "Jamie")
 end
end