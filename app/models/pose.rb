class Pose < ApplicationRecord
  belongs_to :level
   has_many :pose_categories
   has_many :categories, through: :pose_categories
   has_many :reviews
   belongs_to :user
   accepts_nested_attributes_for :reviews, reject_if: proc { |attributes| attributes['content'].blank? }

   # def category_ids=  #should we need this?
   # end

  def self.by_level(level_id)
where(level: level_id)
end
# def self.by_category(category_id)
#     includes(:categories).where(categories: {id: category_id]})
# end

end
