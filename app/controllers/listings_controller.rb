class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  load_and_authorize_resource

  def index
    @listings = Listing.all  #returns all of the listing records from the model because of the instance variable and sends them to the index view for listings
  end

  def show
    @listing = Listing.find(params[:id])
  end

  def new
    @listing = Listing.new #creating a new instance of a listing
  end

  def create
    @listing = current_user.listings.new(listing_params)
    @listing.user_id = current_user.id
    if @listing.save #an instance method, new record gets created in the db
      flash[:success] = "Your new garden art listing has been created!"
      redirect_to @listing #go to show page for @listing
    else
      render :new #action to render new object
    end
  end

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing = Listing.find(params[:id])
    @listing.update(listing_params)
    redirect_to listings_path
  end

  def destroy
    @listing = Listing.find(params[:id])
    @listing.destroy #method to remove/destroy a listing and any of it'd existing dependencies
    redirect_to root_path
  end

  private
  #private methods that can only be called from inside the class
  def listing_params
    params.require(:listing).permit(:title, :description, :price, :picture, :user_id, :category_id)
    #strong parameters containing a list of attributes, with the require and permit methods filtering the list to only the ones allowed through to the create action.
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end
end
