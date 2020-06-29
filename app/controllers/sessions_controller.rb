class SessionsController < ApplicationController
    def create
        @user = User.find_by(name: params[:user][:name])
     
        if @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
        else         
            return head(:forbidden)
            redirect_to action: "new"
        end
    end

    def destroy
        session.delete :name
    end

    private
  
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
