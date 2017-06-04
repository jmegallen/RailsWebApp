class UserMailer < ApplicationMailer
  default from: "jmegallen@gmail.com"

  def contact_form(email, name, phone, message)
    @message = message
    @name = name
    @phone = phone
    mail(:from => email,
         :to => 'jmegallen@gmail.com',
         :subject => "A new contact form message from #{name}")
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver_now
  end

  def welcome_mail(user)
    @user = user
    mail to: user.email, subject: "Welcome to Berlin Bikes", from: "jimmi@g.com"
  end

end