class UsersController < ApplicationController

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    binding.pry
    if @user.save
      flash[:success] = "You successfully created an account!"
      session[:user_id] = @user.id
      redirect_to links_path
    else
      flash[:danger] = "Could not create account because #{@user.errors.full_messages.join(", ")}"
      redirect_to sign_up_path
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :address, :email, :password, :password_confirmation)
  end
  
end