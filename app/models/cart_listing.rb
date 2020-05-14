class CartListing < ApplicationRecord
  belongs_to :listing
  belongs_to :cart
  belongs_to :order
end
