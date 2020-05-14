class ApplicationController < ActionController::Base
    rescue_from CanCan::AccessDenied do |exception|
    flash[:authorization_error] = "Not authorized to perform that action ❌"
    redirect_to listings_path
  end
  
  before_action :current_cart

  private
    def current_cart
      if session[:cart_id]
        cart = Cart.find_by(:id => session[:cart_id])
        if cart.present?
          @current_cart = cart
        else
          session[:cart_id] = nil
        end
      end

      if session[:cart_id] == nil
        @current_cart = Cart.create
        session[:cart_id] = @current_cart.id
      end
    end
end
