class PoseCategoriesController < ApplicationController

  def new
     @pose_category= PoseCategory.new

  end
  def create
      pc= PoseCategory.create(name: params[:pose_category][:name], pose_id: 3, category_id: 1)
      binding.pry #at this point the name is getting saved.. but when i check in the console it's not there.
      #maybe it's missing validations that are needed... cant do strong params because pose_id and category_id werent in te form
      #wasnt working because pose_id 1 didnt exist...
      #also params[:name] wasn't what it was supposed to be...
    redirect_to pose_categories_path
  end
  def index
    @pose_categories= PoseCategory.all

  end

end
