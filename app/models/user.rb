class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :confirmable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :orders
  has_many :comments

  validates :first_name, presence: true 
  validates :last_name, presence: true

  after_create :welcome_mail
  def welcome_mail
    UserMailer.welcome_mail(self).deliver
  end

end