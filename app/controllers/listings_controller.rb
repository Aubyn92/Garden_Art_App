class ListingsController < ApplicationController
    before_action :set_listing, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    # before_action :set_listing, only: [:index]
    load_and_authorize_resource
  
    def index
      # num_list = @unsold_listings.length
      # listings_shown = 9
      # @listings_sold = Listing.where(sold: true)
      # @listings.unsold = Listing.where(sold: false)
      # if !session[:count]
      #   session[:count] = 1
      # else
      #   session[:count] += 1
     @listings = Listing.all
      # end
    end
  
    def show
      @listing = Listing.find(params[:id])
    end
  
    def new
      @listing = Listing.new
    end
  
    def create
      @listing = current_user.listings.new(listing_params)
      @listing.user_id = current_user.id
      if @listing.save
        flash[:success] = "Your new garden art listing has been created!"
        redirect_to @listing
      else
        render :new
      end
    end
      # @listing.errors.any?
      # render :new
      # else
      # flash[:success] = "You successfully created a new listing!"
      # redirect_to @listing
      # redirect_to listing_path
      # end 
  
    def edit
      @listing = Listing.find(params[:id])
    end
  
    def update
    #   if @listing.update(listing_params)
    #     redirect_to listing_path(@listing.id)
    #   else
    #     render :edit
    #   end 
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
      redirect_to root_path
    end

    private

    def listing_params
        params.require(:listing).permit(:title, :description, :price, :picture, :user_id, :category_id)
    end 

   
    # def set_listing
    #     id = params[:id]
    #     @listing = Listing.find(id)
    # end

    def set_listing
      @listing = Listing.find(params[:id])
    end

    # def set_unsold
    #   @unsold_listings = Listing.all.where(sold: false)
    # end
end
