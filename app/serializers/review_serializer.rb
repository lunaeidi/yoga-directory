class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :pose_id, :content #, :username 
end
