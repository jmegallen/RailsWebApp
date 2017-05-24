class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :confirmable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :orders

  after:create
  def welcome_message
    @name = params[:name]
    @email = params[:email]
    UserMailer.welcome_mail(@email, @name).deliver_now
  end

end
