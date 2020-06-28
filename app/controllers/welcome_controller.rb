class WelcomeController < ApplicationController
  before_action :require_login
  def home
      @user = User.find_by(id: session[:user_id])
  end

  private
  def require_login
    return redirect_to '/login' unless session.include? :user_id
  end
end
