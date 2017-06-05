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
    @phone = params[:phone]
    UserMailer.contact_form(@email, @name, @phone, @message).deliver_now
  end

  def welcome_mail(user)
    @user = user
    mail to: user.email, subject: "Welcome to Berlin Bikes"
  end

  def payment_received(user, product)
    @user = user
    @product = product
    @name = user.name
    mail to: user.email, subject: "Thank you for your order."
  end

end