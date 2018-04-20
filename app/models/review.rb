class Review < ApplicationRecord
  belongs_to :pose
  belongs_to :user
end
