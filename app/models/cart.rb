class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_listings
  has_many :listings, through: :cart_listings
end

def price_display(price)
  '$' + sprintf('%.2f', (price / 100.0))
end
