class Category < ApplicationRecord
  has_many :pose_categories
 has_many :poses, through: :pose_categories
end
