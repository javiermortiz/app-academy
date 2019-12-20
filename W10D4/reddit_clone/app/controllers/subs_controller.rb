class SubsController < ApplicationController
  before_action :require_log_in, only: [:new, :edit, :destroy]
  def index
    render :index
  end

  def new
    render :new
  end

  def create
    @sub = current_user.subs.new(sub_params)
    if @sub.save 
      redirect_to sub_url(@sub.id)
    else  
      render :new 
    end 
  end

  def edit
    @sub = current_user.subs.find(params[:id])
    if @sub
      render :edit
    else
      flash[:errors] = ["Don't touch my stuff!"]
  end

  def update
    sub = Sub.find(params[:id])
    if sub.update(sub_params)
      redirect_to sub_url(sub.id)
    else
      flash.now[:errors] = ["Don't mess!"]
      render :edit
  end

  def destroy
  end

  def show
    @sub = Sub.find(params[:id])
    render :show
  end

  def sub_params
    params.require(:sub).permit(:title, :description)
  end 
end
