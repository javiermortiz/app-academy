class UsersController < ApplicationController

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in(@user)
      redirect_to subs_url
    else
      render :new, status: 422
    end
  end

  def delete
    user.find_by(params[:id]).destroy!
    redirect_to new_user_url
  end 

  def user_params 
    params.require(:user).permit(:email, :password)
  end 

  
end