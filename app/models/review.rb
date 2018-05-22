class Review < ApplicationRecord
  belongs_to :pose
  belongs_to :user

  def username
    
  end
end
