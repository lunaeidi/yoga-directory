require 'pry'
class PosesController < ApplicationController

helper_method :params
  def new
    if !logged_in?
      return redirect_to controller:'sessions', action:'new'
      flash[:message]= "You must be logged in to list a pose."
    end
    @pose= Pose.new
  end
  def create
    #  binding.pry
    pose= current_user.poses.create(pose_params)
    #@picname= params[:pose][:pic].original_filename #didnttransfer to view !
    binding.pry

        # pose= Pose.create(pose_params)
      # pose.user_id = current_user.id
      # current_user.poses << pose
      redirect_to pose_path(pose)


#params[:pic] has @tempfile and @original_filename
      @filename = params[:pose][:pic].original_filename #need to change these to include [pose]
file = params[:pose][:pic].tempfile
# .to_path.to_s  #instead of just tempfile


File.open("./public/#{@filename}", 'wb') do |f|
f.write(file.read)
end
  end



  def edit
    @pose=Pose.find(params[:id])
    if !logged_in?
      return redirect_to controller:'sessions', action:'new'
      flash[:message]= "You must be logged in to do that."
    end
    if @pose.user_id != current_user.id
      return redirect_to poses_path
      flash[:message]= "You don't have permission to do that."
    end




  end
  def update
    @pose=Pose.find(params[:id])
    @pose.update(pose_params)
    redirect_to pose_path(@pose)
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
    @user= User.find(session[:user_id]) if session[:user_id]
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

  def show

    @pose=Pose.find(params[:id])
    if @pose.reviews.empty?
        @reviews= "No reviews yet."
    else
    #  binding.pry
      @reviews= @pose.reviews
      #tried doing it here with:
      #@pose.reviews.map do |review|
      #review.user.username says review.content
    #end
    end
      @review= Review.new
  end


private
def pose_params
  params.require(:pose).permit(:name,:content,:pic, :level_id,reviews_attributes: [:content], category_ids:[])
end
end
