class UsersController < ApplicationController
    before_action :redirect_to_index

    def new
        render :new
    end

    def create
        user = User.new(user_params)
        if user.save
            login_user!
            redirect_to cats_url
        else  
            flash[:error] = user.error.full_messages
            render :new, status: 422
        end
    end

    private 

    def user_params
        params.require(:user).permit(:user_name, :password)
    end
end