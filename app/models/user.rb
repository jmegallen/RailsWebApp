class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :confirmable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :orders

  after_create :welcome_mail
  def welcome_mail
    UserMailer.welcome_mail(self).deliver
  end

end