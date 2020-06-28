class WelcomeController < ApplicationController
  def home
    if !!session[:user_id] && !session[:user_id].empty?
      @user = User.find_by(id: session[:user_id])
    else
      redirect_to '/login'
    end
  end

  private
  def require_login
    return redirect_to '/login' unless session.include? :user_id
  end
end
