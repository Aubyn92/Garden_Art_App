class CartListing < ApplicationRecord
  belongs_to :listing
  belongs_to :cart
  belongs_to :order

  def total_price
    self.quantity * self.product.total_price
  end
end
