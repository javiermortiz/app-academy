class SessionsController < ApplicationController
    before_action :redirect_to_index, only: [:new, :create]

    def new
        render :new 
    end 

    def create
        login_user!
        redirect_to cats_url
    end 

    def destroy
        current_user.reset_session_token! if current_user
        session[:session_token] = nil
        redirect_to cats_url
    end 

end 