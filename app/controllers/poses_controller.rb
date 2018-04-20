class PosesController < ApplicationController
  def new
  end
  def create
  end
  def edit
    @pose=Pose.find(params[:id])
  end
  def update
    @pose=Pose.find(params[:id])
  end
  def destroy
    @pose=Pose.find(params[:id])
    if current_user.id = @pose.user_id
      @pose.delete
      redirect_to poses__path
    else
      redirect_to poses_path
  end
  def index
    @user= User.find(session[:user_id])
    @poses=Post.all
  end
  def show
    @pose=Pose.find(params[:id])
  end
end
