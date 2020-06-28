class UsersController < ApplicationController
  def new
  end
  
  def create
    @user = User.new(name: params[:user][:name])
    if params[:user][:password] == params[:user][:password_confirmation] && !!params[:user][:password]
      @user.password = params[:user][:password]
      if @user.save
        session[:user_id] = @user.id
        byebug
        redirect_to '/welcome'
      else
        redirect_to '/users/new'
      end
    else
      redirect_to '/users/new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
