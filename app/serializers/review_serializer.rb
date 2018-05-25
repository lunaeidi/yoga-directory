class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :pose_id, :content , :username
  def username
  #  binding.pry
    u= User.find(object.user_id)
    u.username
  end
end
