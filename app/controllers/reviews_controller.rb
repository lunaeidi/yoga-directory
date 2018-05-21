class ReviewsController < ApplicationController
  # def create
  #   Review.create(content: params[:review][:content],user_id: params[:review][:user_id], pose_id:params[:review][:pose_id])
  #
  #   @pose = Pose.find(params[:review][:pose_id])
  #   redirect_to pose_path(@pose)
  # end

  def create
  @review = Review.create(content: params[:review][:content],user_id: params[:review][:user_id], pose_id:params[:review][:pose_id])
  render json: @review, status: 201
end

end
