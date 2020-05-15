class ListingsController < ApplicationController
    before_action :set_listing, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    load_and_authorize_resource
  
    def index
     @listings = Listing.all
    end
  
    def show
    end
  
    def new
      @listing = Listing.new
    end
  
    def create
      # @listing = current_user.listings.create(listing_params)
      @listing = Listing.create(listing_params)
      # if 
      # @listing.errors.any?
      # render :new
      # else
      # flash[:success] = "You successfully created a new listing!"
      # redirect_to @listing
      redirect_to listing_path
      # end 
    end
  
    def edit
      @listing = Listing.find(params[:id])
    end
  
    def update
      # if @listing.update(listing_params)
      #   redirect_to listing_path(@listing.id)
      # else
      #   render :edit
      # end 
      @listing = Listing.find(params[:id])
      @listing.update(listing_params)
      redirect_to listings_path
    end
  
    def destroy
      # @listing.destroy
      # redirect_to root_path
      @listing = Listing.find(params[:id])
      @listing.destroy
      redirect_to listings_path
    end

    private

    def listing_params
        params.require(:listing).permit(:title, :description, :price, :picture, :user_id, :category)
      end 

    def set_listing
        id = params[:id]
        @listing = Listing.find(id)
    end
end
