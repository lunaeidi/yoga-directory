class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: true, presence: true
  validates :password, presence: true
  validates :email, uniqueness: true, presence: true
  has_many :poses
  has_many :reviews #the ones they make
end
