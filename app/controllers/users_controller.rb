class UsersController < ApplicationController
  def new

  end
  def create
    if user=User.find_by_username(params[:username])
      flash[:message] = "Username already exists" #does this work alone?
      return redirect_to controller:'users', action:'new'
    elsif params[:username].empty? #have validation in model... and put the message there and do if user.save
    flash[:message]= "You must include a username"
    return  redirect_to controller:'users', action:'new'
  else #where do I want them to be directed once logged in?
    @user=  User.create(username: params[:username],email: params[:email], password: params[:password])
session[:user_id] = @user.id
redirect_to poses_path
  end
end
def home

    redirect_to poses_path   if logged_in?

    #  @user= User.find(session[:user_id])

end
end
