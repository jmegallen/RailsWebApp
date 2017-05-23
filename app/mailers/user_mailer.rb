class UserMailer < ApplicationMailer
	default from: "jmegallen@gmail.com"

	def contact_form(email, name, message)
		@message = message
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

	def welcome_mailer(email, name)
		@message = message
		mail(:from => 'jmegallen@gmail.com',
				 :to => email,
			 	 :subject => "Welcome to world of Berlin bikes.....")
	end

	def welcome_message
		@name = params[:name]
		@email = params[:email]
		UserMailer.welcome_mail(@email, @name).deliver_now
	end

end
