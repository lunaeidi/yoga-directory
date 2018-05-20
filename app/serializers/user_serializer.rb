class UserSerializer < ActiveModel::Serializer
  attributes :id, :poses
  has_many :poses
end
