class SessionsController < ApplicationController

    def new
        render :new
    end 

    def create
        @user = User.find_by_credentials(params[:email], params[:password])
        if @user
            login_user!(@user)
            redirect_to bands_url
        else 
            render :new, status: 422
        end 
    end 

    def destroy
        logout_user!
        redirect_to bands_url
    end 

end 