class PosesController < ApplicationController
  def new
    @pose= Pose.new
  end
  def create
    pose = Post.create(post_params)
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
    @categories= Category.all
    @levels= Level.all

    if !params[:level].blank?
    @poses = Post.where(level: params[:level])
    #then check category
  elsif !params[:category].blank?
    @poses= Post.where(category: params[:category]) #or might need to do .include? since its many categories
    end
  else
    # if no filters are applied, show all poses
    @poses = Pose.all
  end
end
  end
  def show
    @pose=Pose.find(params[:id])
  end
end
private
def pose_params
  params.require(:pose).permit(:name,:content,:image, category_ids:[])
end
