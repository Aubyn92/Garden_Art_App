class Cart < ApplicationRecord
  has_many :cart_listings, dependent: :destroy
  has_many :listings, through: :cart_listings
  belongs_to :user

  def sub_total
    sum = 0
    self.cart_listings.each do |cart_listing|
      sum+= cart_listing.total_price
    end
    return sum
  end
end
