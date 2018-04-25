require 'pry'
class PosesController < ApplicationController
helper_method :params
  def new

    @pose= Pose.new
  end
  def create
    #  binding.pry
    pose= current_user.poses.create(pose_params)

  #  pose.pic= params[pose][:pic] #dont need this
      # pose= Pose.create(pose_params)
      # pose.user_id = current_user.id
      # current_user.poses << pose
      redirect_to pose_path(pose)
    binding.pry
#params[:pic] has @tempfile and @original_filename
      @filename = params[:pic].original_filename
file = params[:pic].tempfile

File.open("./public/#{@filename}", 'wb') do |f|
f.write(file.read)
end
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
    @user= User.find(session[:user_id])
      #  @poses=Pose.all
@categories= Category.all
   @levels= Level.all

    if !params[:level].blank?
    @poses =  Pose.by_level(params[:level])
  elsif !params[:categories].blank?
      #@poses= Pose.includes(:categories).where(categories: {id: params[:categories]})
   @poses= Pose.by_category(params[:categories])
     else
    # if no filters are applied, show all poses
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
