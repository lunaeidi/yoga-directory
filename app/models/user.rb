class User < ApplicationRecord::Base
  has_secure_password
  validates :username, uiqueness: true, presence: true
  validates :password, presence: true
  validates :email, uniqueness: true 
  has_many :poses
  has_many :reviews #the ones they make
end
