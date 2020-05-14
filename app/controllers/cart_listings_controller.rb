class CartListingsController < ApplicationController

    def create
        chosen_listing = Listing.find(params[:listing_id])
        current_cart = @current_cart

    if current_cart.listings.include?(chosen_listing)
        @cart_listing = current_cart.cart_listings.find_by(:listing_id => chosen_listing)
        @cart_listing.quantity += 1
    else
        @cart_listing = CartListing.new
        @cart_listing.cart = current_cart
        @cart_listing.listing = chosen_listing
    end
        @cart_listing.save
        redirect_to cart_path(current_cart)
    end

    def add_quantity
        @cart_listing = CartListing.find(params[:id])
        @cart_listing.quantity += 1
        @cart_listing.save
        redirect_to cart_path(@current_cart)
    end

    def reduce_quantity
        @cart_listing = CartListing.find(params[:id])
        if 
          @cart_listing.quantity > 1
          @cart_listing.quantity -= 1
        end
        @cart_listing.save
        redirect_to cart_path(@current_cart)
    end

    def destroy
        @cart_listing = CartListing.find(params[:id])
        @cart_listing.destroy
        redirect_to cart_path(@current_cart)
    end

    private

    def cart_listing_params
    params.require(:cart_listing).permit(:quantity,:listing_id, :cart_id)
  end
end
