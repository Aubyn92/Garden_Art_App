class ListingsController < ApplicationController
    before_action :set_listing, only: [:show, :edit, :update, :destroy]
    
    def index
        @listings = Listing.all 
    end

    def show
 
    end

    def new
    end

    def create
        #finish logic for creating a record
    end

    def edit

    end

    def update

    end

    def destroy

    end

    private

    def set_listing
        id = params[:id]
        @listing = Listing.find(id)
    end
end
