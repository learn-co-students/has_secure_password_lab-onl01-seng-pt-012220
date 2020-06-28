class UsersController < ApplicationController
  def new
  end
  
  def create
    if params[:user][:password] == params[:user][:password_confirmation] && !!params[:user][:password]
      @user = User.new(user_params)
      if @user.save
        redirect_to '/welcome'
      else
        redirect_to '/users/new'
      end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
