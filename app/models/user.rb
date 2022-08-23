class User < ApplicationRecord
  # devise_for :users, skip: :all
  attr_accessor :token
  has_many :posts 

  has_many :reviews
  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true
  validate :user_quota, :on => :create  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable       

   
          

end
