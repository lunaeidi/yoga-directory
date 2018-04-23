class Pose < ApplicationRecord
  belongs_to :level
  has_many :pose_categories
  has_many :categories, through: :pose_categories
  has_many :reviews
  belongs_to :user
end
