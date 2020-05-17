class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_listings
  has_many :listings, through: :cart_listings
end

# def sub_total(price)
#     sum = 0
#     self.cart_listings.each do |cart_listing|
#       sum+= cart_listing.total_price
#     end
#     return sum
#   end

def price_display(price)
  '$' + sprintf('%.2f', (price / 100.0))
end
