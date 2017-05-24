class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :confirmable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :orders

  # after:create :welcome_mail
  # def welcome_mail
  #   Usermailer.welcome_mail(self).deliver
  #   # redirect_to root_path, alert: "Thank you for joining us"
  # end  

end
