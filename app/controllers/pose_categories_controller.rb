class PoseCategoriesController < ApplicationController

  def new
     @pose_category= PoseCategory.new
    
  end
  def create
    PoseCategory.create(name: params[:name], pose_id:1, category_id:1)
    redirect_to poses_path
  end
end
