class PosesController < ApplicationController
  def new
    @pose= Pose.new
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
  end
  def show
    @pose=Pose.find(params[:id])
  end
end
private
def post_params
  params.require(:post).permit(:name,:content,:image, category_ids:[])
end
