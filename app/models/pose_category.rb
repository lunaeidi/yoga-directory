class PoseCategory < ApplicationRecord
  belongs_to :pose
  belongs_to :category
end
