class SessionsController < ApplicationController
  def new
  end
  def create
    byebug
    if !!params[:name] && !params[:name].empty? 
      @user = User.find_by(name: params[:name])
      return head(:forbidden) unless @user.authenticate(params[:password])
      session[:user_id] = @user.id
    else
      redirect_to '/login'
    end
  end
  def destroy
    
  end
end
