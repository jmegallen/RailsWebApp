class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
	has_many :orders


	 # devise confirm! method overriden
  def confirm!
    welcome_message
    super
  end

  # devise_invitable accept_invitation! method overriden
  def accept_invitation!
    self.confirm!
    super
  end

  # devise_invitable invite! method overriden
  def invite!
    super
    self.confirmed_at = nil
    self.save
  end

	private

  def welcome_message
    UserMailer.welcome_mail(self).deliver
  end

end
