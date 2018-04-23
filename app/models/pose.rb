class Pose < ApplicationRecord
  belongs_to :level
  # has_many :pose_categories
  # has_many :categories, through: :pose_categories
  # has_many :reviews
   belongs_to :user

#   def self.by_level(level_id)
# where(level: level_id)
# end
# def self.by_category(level_id)
# where(category: category_id)  #or might need to do .include? since its many categories
# end
end
