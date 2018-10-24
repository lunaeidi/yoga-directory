class SessionsController < ApplicationController
  def new

  end
  def create #need email too because of omniauth option

    if auth = request.env['omniauth.auth']
      @user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.username = auth['info']['username']
        u.email = auth['info']['email']
      end
      session[:user_id] = @user.id
      render 'users/home' #is this interchangeable with redirect_to controller:'....' or can do redirect_to root_path

    else #login normal way
      user = User.find_by(:username => params[:username])
      if user && user.authenticate(params[:password])
        session[:user_id]= user.id
        return redirect_to poses_path
      else
        flash[:error]= "Invalid username or password" #does this work? u need the middleware use flash? or just :alert?
        redirect_to controller: 'sessions', action: 'new'
      end
    end
  end
  def destroy
    session.clear
    redirect_to controller:'users',action:'home'
  end
end
