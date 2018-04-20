class Category < ApplicationRecord
  has_many :poses, through: :pose_categories 
end
