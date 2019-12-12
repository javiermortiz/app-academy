class CatsController < ApplicationController
    def index
        render :index
    end

    def show
        @cat = Cat.find(params[:id])
        render :show
    end

    def edit 
        @cat = Cat.find(params[:id])
        render :edit 
    end 

    def update
        @cat = Cat.find(params[:id])
        if @cat.update_attributes(cat_params)
            redirect_to cat_url(@cat.id)
        else  
            render :edit
        end 
    end 

    def new
        @cat = Cat.new
        render :new 
    end 

    def create
        @cat = Cat.new(cat_params)
        if @cat.save
            redirect_to cat_url(@cat.id)
        else  
            render :new
        end 
    end 

    private

    def cat_params
        params.require(:cat).permit(:birth_date, :color, :name, :sex, :description)
    end
end