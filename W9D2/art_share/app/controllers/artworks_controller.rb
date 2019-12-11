class ArtworksController < ApplicationController

    def index 
        if params[:user_id]
            user = User.find(params[:user_id])
            render json: user.artworks
        else
            render json: Artwork.all 
        end  
    end 

    def create 
        artwork = Artwork.new(artwork_params)
        if artwork.save
            render json: artwork 
        else  
            render json: artwork.error.full_messages, status: 422
        end
    end 

    def destroy 
        artwork = Artwork.find(params[:id])
        artwork.destroy 
        render json: artwork 
    end 

    def show 
        render json: Artwork.find(params[:id])
    end
    
    def update 
        artwork = Artwork.find(params[:id])
        if artwork.update(artwork_params)
            render json: artwork 
        else  
            render json: arwork.errors.full_messages 
        end  
    end 

    private
    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end 
end 