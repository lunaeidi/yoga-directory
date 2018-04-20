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
    if current_user.id = @pose.user.id
  end
  def index
    @poses=Post.all
  end
  def show
    @pose=Pose.find(params[:id])
  end
end
