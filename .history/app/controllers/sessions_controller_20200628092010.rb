class SessionsController < ApplicationController
  def new
  end
  def create
    if !!params[:user][:name] && !params[:user][:name].empty? 
      byebug
      @user = User.find_by(name: params[:user][:name])
      return head(:forbidden) unless @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
    else
      redirect_to '/login'
    end
  end
  def destroy
    
  end
end
