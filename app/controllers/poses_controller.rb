require 'pry'
class PosesController < ApplicationController
helper_method :params
  def new

    @pose= Pose.new
  end
  def create
    #  binding.pry
      pose= Pose.create(pose_params)
      pose.user_id = current_user.id
      current_user.poses << pose
      redirect_to pose_path(pose)
  end



  def edit
    @pose=Pose.find(params[:id])
  end
  def update
    @pose=Pose.find(params[:id])
    @pose.update(pose_params)
  end
  def destroy
    @pose=Pose.find(params[:id])
    if current_user.id == @pose.user_id
      @pose.delete
      redirect_to poses_path
    else
      redirect_to poses_path
  end
end
  def index
    #@user= User.find(session[:user_id])
    @poses=Pose.all


# @categories= Category.all
  #  @levels= Level.all
  #
  #   if !params[:level].blank?
  # #  @poses =  Pose.by_level(params[:level])
  #   @poses=Pose.where(level: params[:level])
  #   #then check category
  # elsif !params[:category].blank?
  # #  @poses= Pose.by_category(params[:category])
  #   @poses=Pose.where(category: params[:category]) #or might need to do .include? since its many categories
  #  else
    # if no filters are applied, show all poses
  #  @poses = Pose.all
  #end

  end
  def show
    @pose=Pose.find(params[:id])
    @review= @pose.reviews.build
  end

#,
private
def pose_params
  params.require(:pose).permit(:name,:content,:image, :level_id,reviews_attributes: [:content], category_ids:[])
end
end
