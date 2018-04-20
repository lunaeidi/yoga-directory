class User < ApplicationRecord::Base
  has_secure_password
  validates :username, uiqueness: true, presence: true
  validates :password, presence: true 

end
