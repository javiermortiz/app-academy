class AlbumsController < ApplicationController

    def new
        @band = Band.find(params[:band_id])
        render :new
    end 

    def create
        @band = Band.find(params[:band_id])
        @album = @band.albums.newnew(album_params)
        if @album.save
            redirect_to album_url(params[:id])
        else  
            render :new, status: 422
        end 
    end 

    def edit
        @album = Album.find(params[:id])
        render :edit
    end 

    def show
        @album = Album.find(params[:id])
        render :show
    end 

    def update
        @album = Album.find(params[:id])
        if @album.update(album_params)
            redirect_to album_url(params[:id])
        else  
            render :edit, status: 422
        end 
    end 

    def destroy
        @album = Album.find(params[:id])
        @band = @album.band 
        @album.destroy!
        redirect_to band_url(@band.id)
    end 

    private
    def album_params
        params.require(:album).permit(:title, :year, :live_album)
    end 
end 