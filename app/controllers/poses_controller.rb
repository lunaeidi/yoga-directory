require 'pry'
class PosesController < ApplicationController
before_action :find_by_id, only: [:edit,:update,:destroy, :show]
  def new
    if !logged_in?
      flash[:error]= "You must be logged in to list a pose."
      return redirect_to controller:'sessions', action:'new'
    end
    @pose= Pose.new(level_id: params[:level_id])

    end
  def create
          pose= current_user.poses.new(pose_params)
          if pose.valid?
      pose.save
      redirect_to poses_path
#redirect_to "poses/#{pose.id}"

 else
redirect_to controller:'poses', action:'new'
end
  end



  def edit
    if !logged_in?
      flash[:error]= "You must be logged in to do that."
      return redirect_to controller:'sessions', action:'new'

    end
    if @pose.user_id != current_user.id
      flash[:error]= "You don't have permission to do that."
      return redirect_to poses_path
    end
  end

  def update
    if  @pose.update(pose_params)
    redirect_to pose_path(@pose)
  else
    redirect_to controller:'poses', action:'edit'
  end
  end
  def destroy
        if current_user.id == @pose.user_id
      @pose.delete
      redirect_to poses_path
    else
      redirect_to poses_path
  end
end
  def index
      if session[:user_id]
      @user= User.find(session[:user_id])
    end
    if params[:level_id]
      @level= Level.find_by(id: params[:level_id])
      if @level.nil?
        flash[:message]= "Level not found."
        redirect_to levels_path
      else
      @poses= @level.poses
      end
    else
      #  @poses=Pose.all
@categories= Category.all
   @levels= Level.all

    if !params[:level].blank?
    @poses =  Pose.by_level(params[:level])
  elsif !params[:categories].blank?
         @poses= Pose.by_category(params[:categories])
     else
       @poses = Pose.all
  end
  end
end

  def show
      if @pose.reviews.empty?
        @reviews= "No reviews yet."
    else
        @reviews= @pose.reviews
    end
      @review= Review.new
      respond_to do |format|
  format.html { render :show }
  format.json { render json: @post, status: 200 } #but like this it returns null
end
      # render json: @pose, status: 200 the .json worked when it was just this
    end


private
def pose_params
  params.require(:pose).permit(:name,:content,:pic,:image, :level_id,reviews_attributes: [:content], category_ids:[])
end
def find_by_id
@pose=Pose.find(params[:id])
end

end
