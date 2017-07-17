class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      flash[:success] = "Log in successful"
      session[:user_id] = user.id
      redirect_to links_path
    else
      flash.now[:danger] = "Unsuccessful login"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:danger] = "You are now logged out."
    redirect_to login_path
  end
  
end