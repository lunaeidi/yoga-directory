class Review < ApplicationRecord
  belongs_to :pose
  belongs_to :user

  def username(id) #find the next id in the database
    u= User.find(id)
    u.username
  end
end
