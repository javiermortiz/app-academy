class UsersController < ApplicationController

    def new
        @user = User.new
        render :new
    end 

    def create
        @user = User.new(user_params)
        if @user.save
            login_user!(@user)
            redirect_to bands_url
        else  
            render :new, status: 422
        end 
    end 

    def show
        @user = User.find(current_user.id)
        render :show 
    end 

    private
    def user_params
        params.require(:user).permit(:email, :password)
    end
end 