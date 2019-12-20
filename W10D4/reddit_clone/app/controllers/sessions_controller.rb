class SessionsController < ApplicationController

    def new
        render :new
    end 

    def create
        user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        if user 
            log_in(user)
            redirect_to subs_index_url
        else  
            flash.now[:errors] = ["wrong email/password"]
            render :new
        end 
    end 

    def destroy
        user = User.find(current_user.id)
        log_out!(user)
        redirect_to new_session_url #change later maybe
    end 
end 