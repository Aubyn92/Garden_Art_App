class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  # before_action :set_listing, only: [:index]
  load_and_authorize_resource

  def index
    @listings = Listing.all
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
    @listing.destroy
    redirect_to root_path
  end

  private

  def listing_params
    params.require(:listing).permit(:title, :description, :price, :picture, :user_id, :category_id)
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end
end
