class ApplicationController < ActionController::Base
    rescue_from CanCan::AccessDenied do |exception|
    # flash[:authorization_error] = "No...... "
    render file: "#{Rails.root}/public/403.html" , status: 403
    # redirect_to listings_path
    # before_action :current_cart

  end

  # def cart
  #   @cart= Cart.find(session[:cart_id])
  # rescue ActiveRecord::RecordNotFound
  #   @cart = Cart.create
  #   session[:cart_id] = @cart.id
  # end

  # private
  #   def current_cart
  #     if session[:cart_id]
  #       cart = Cart.find_by(:id => session[:cart_id])
  #       if cart.present?
  #         @current_cart = cart
  #       else
  #         session[:cart_id] = nil
  #       end
  #     end

  #     if session[:cart_id] == nil
  #       @current_cart = Cart.create
  #       session[:cart_id] = @current_cart.id
  #     end
    # end
end
