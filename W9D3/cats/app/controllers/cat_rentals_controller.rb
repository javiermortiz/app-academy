class CatRentalsController < ApplicationController
    def new
        render :new
    end

    def create 
        @cat_rental = CatRental.new(cat_rental_params)
        if @cat_rental.save
            redirect_to cat_url(@cat_rental.cat_id)
        else  
            render :new
        end
    end

    def approve
        current_rental_requests.approve!
        redirect_to cat_url(@cat_rental.cat_id)
    end 

    def deny
        current_rental_requests.deny!
        redirect_to cat_url(@cat_rental.cat_id)
    end 

    private
    def cat_rental_params
        params.require(:cat_rental).permit(:cat_id, :start_date, :end_date, :status)
    end 

    def current_rental_requests
        @cat_rental ||= CatRental.joins(:cat).last
    end 
end