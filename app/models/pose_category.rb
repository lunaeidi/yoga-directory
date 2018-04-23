class PoseCategory < ApplicationRecord
  belongs_to :poses
  belongs_to :categories
end
