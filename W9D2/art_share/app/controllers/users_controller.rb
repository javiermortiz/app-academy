class UsersController < ApplicationController
   
    def favorites
        user = User.find(params[:id])
        favorite = user.artworks.where(favorite: true)
        render json: favorite
    end

    def index
        query_val = params[:username]
        if query_val
            user = User.where(username: query_val)
            render json: user
        else
            render json: User.all
        end
    end

    def show
        render json: User.find(params[:id])
    end

    def update
        user = User.find(params[:id])
        if user.update_attributes(user_params)
            render json: user
        else
            render json: user.errors.full_messages, status: 422
        end
    end
    
    def create
        user = User.new(user_params)
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: 422
        end
    end

    def destroy
        user = User.find(params[:id])
        user.destroy
        render json: user
    end

    private
    def user_params
        params.require(:user).permit(:username)
    end
end