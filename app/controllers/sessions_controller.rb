class SessionsController < ApplicationController
  def new
    if
  end
  def create
     user = User.find_by(:username => params[:user][:username])
     if user && user.authenticate(params[:user][:password])
       session[:user_id]= user.id
       return redirect_to
     else
       flash[:message]= "Invalid username or password" #does this work? u need the middleware use flash? or just :alert?
       redirect_to controller: 'sessions', action: 'new'
     end
  end
  def destroy
    session.clear
    redirect_to
  end
end
