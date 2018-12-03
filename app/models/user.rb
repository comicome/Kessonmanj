class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments, dependent: :destroy
  has_many :labels, dependent: :destroy
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, uniqueness: true
end
