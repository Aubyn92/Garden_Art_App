class ListingsController < ApplicationController
    before_action :set_listing, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    before_action :find_listing, only: [:show]
    load_and_authorize_resource
  
    def index
      @listings_sold = Listing.where(sold: true)
      @listings_unsold = Listing.where(sold: false)
      if !session[:count]  
        session[:count] = 1
      else
        session[:count] += 1
      end
    #   byebug
      @listings = Listing.where(params[:listing])
    end
  
    def show
    end
  
    def new
      @listing = Listing.new
    end
  
    def create
      @listing = current_user.listings.create(listing_params)
      if @listing.errors.any?
        render :new
      else
        flash[:success] = "You successfully created a new listing!"
        redirect_to @listing
      end 
    end
  
    def edit
    end
  
    def update
      if @listing.update(listing_params)
        redirect_to listing_path(@listing.id)
      else
        render :edit
      end 
    end
  
    def destroy
      @listing.destroy
      redirect_to root_path
    end

    def self.where(where)
        if where 
            listings = Listing.all
            # listings = listings.where(role: search[:":role"][","])
            listings = listings.where(title: search[:":title"][","])
            listings = listings.where(category: search[:":category"][","])
            listings = listings.where(price: search[:":price"][","])
            #byebug
            return listings
        else
            Listing.all
        end
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
