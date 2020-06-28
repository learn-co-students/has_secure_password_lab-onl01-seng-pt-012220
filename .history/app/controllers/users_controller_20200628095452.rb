class UsersController < ApplicationController
  def new
  end
  
  def create
    @user = User.new(user_params)
    byebug
    if @user.save
      @user 
    else
      redirect_to 'users/new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
