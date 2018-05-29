class PoseCategoriesController < ApplicationController

  def new
     @pose_category= PoseCategory.new

  end
  def create
      pc= PoseCategory.create(name: params[:pose_category][:name], pose_id: 3, category_id: 1)
    
    redirect_to pose_categories_path
  end
  def index
    @pose_categories= PoseCategory.all

  end

end
