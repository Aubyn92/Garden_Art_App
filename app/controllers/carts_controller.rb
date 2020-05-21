class CartsController < ApplicationController
  def index
    if user_signed_in? && current_user.carts.last #if the current user is signed in and has a cart already, add chosen listing to cart by listing id before redirecting to the view listings page again
      @cart = current_user.carts.last.listings
      @listing_ids = @cart.map do |listing|
        listing.id
      end
    else
      redirect_to listings_path
    end
  end

  def create
    if current_user.carts.empty?
      cart = Cart.create(completed: false, user_id: current_user.id) #create a new cart if the current users' cart is empty, otherwise use the existing cart
    else
      cart = current_user.carts.last
    end
    listing = Listing.find(params[:listing_id]) #find listing by it's id specified in the params and push in cart listings 
    cart.listings << listing
    redirect_to listings_path
  end
end
