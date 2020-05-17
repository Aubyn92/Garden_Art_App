class PaymentsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:webhook]
    def success
      @listing = Listing.find(params[:listingId])
    end
    
def get_stripe_id
  # @listing = Listing.find(params[:id])
  @cart = current_user.carts.where(completed: false)[0]
  listings = []
  @cart.listings.each do |listing|
    listings << {
      title: listing.title,
      description: listing.description,
      amount: listing.price * 100,
      currency: 'aud',
      quantity: 1
    }
  end

  # session_id = Stripe::Checkout::Session.create(
  #   payment_method_types: ['card'],
  #   customer_email: current_user.email,
  #   line_items: [{
  #     #the logic would need to be an array of hashes, not just one hash
  #     name: @listing.title,
  #     description: @listing.description,
  #     amount: @listing.deposit * 100,
  #     currency: 'aud',
  #     quantity: 1,
  #     }],
  #     payment_intent_data: {
  #       metadata: {
  #         user_id: current_user.id,
  #         listing_id: @listing.id
  #       }
  #     },
  #     success_url: "#{root_url}payments/success?userId=#{current_user.id}&listingId=#{@listing.id}",
  #     cancel_url: "#{root_url}listings"
  #   ).id
  #   render :json => {id: session_id, stripe_public_key: Rails.application.credentials.dig(:stripe, :public_key)}
  # end

  session_id = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: listings,
      payment_intent_data: {
        metadata: {
          user_id: current_user.id,
          cart_id: @cart.id
          }
        },

        success_url: "#{root_url}payments/success?userId=#{current_user.id}&listingId=#{@cart.id}",
        cancel_url: "#{root_url}listings"
      ).id
      render :json => {id: session_id, stripe_public_key: Rails.application.credentials.dig(:stripe, :public_key)}
    end

    def webhook
        payment_id= params[:data][:object][:payment_intent]
        payment = Stripe::PaymentIntent.retrieve(payment_id)
        cart_id = payment.metadata.listing_id
        user_id = payment.metadata.user_id
        cart = Cart.find(cart_id)
        cart.listings.each do |listing|
          listing.sold = true
          listing.save
        end
        cart.state = 'paid'
        cart.save
        head 200
    end

    def success
        @cart = Cart.find(params[:cartId])
        @total = 0
        @cart.listings.each do |listing|
        @total += listing.price
    end
  end
end
    