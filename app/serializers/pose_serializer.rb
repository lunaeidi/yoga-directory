class PoseSerializer < ActiveModel::Serializer
  attributes :id, :name, :content, :categories, :reviews, :image
  #do i need to do the relationships
  has_many :categories
  has_many :reviews
  belongs_to :user
end
