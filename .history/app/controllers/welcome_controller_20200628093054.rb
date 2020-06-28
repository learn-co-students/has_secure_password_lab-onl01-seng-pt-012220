class WelcomeController < ApplicationController
  def home
    if !!session[:user_id] && !session[:user_id].empty?
      @user = User.find_by(id: session[:user_id])
    else
      redirect_to '/login'
    end
  end
end
