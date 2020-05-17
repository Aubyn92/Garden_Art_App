class OrdersController < ApplicationController

  # def index
  #   @orders = Order.all
  # end

  # def show
  #   @order = Order.find(params[:id])
  # end

  # def new
  #   @order = Order.new
  # end

  # def create
  #   @order = Order.new(order_params)
  #   @current_cart.cart_listings.each do |item|
  #   @order.cart_listings << item
  #   item.cart_id = nil
  # end
  #   @order.save
  #   Cart.destroy(session[:cart_id])
  #   session[:cart_id] = nil
  #   redirect_to root_path
  # end

#   def create
#     if !current_user.cart
#       cart = Cart.create(completed: false, user_id: current_user.id)
#     else
#       cart = current_user.cart
#     end 

#     @listing = Listing.find(params[:listing_id])
#     cart.listings << listing_id
#     redirect_to listings_path
#   end
  
#   private
#     def order_params
#       params.require(:order).permit(:name, :email, :address, :pay_method)
#     end
# end
end