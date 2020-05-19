class CartListing < ApplicationRecord
  belongs_to :cart
  belongs_to :listing

  # def total_price
  #   self.quantity * self.product.total_price
  # end
end
