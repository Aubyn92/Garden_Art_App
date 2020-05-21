class Listing < ApplicationRecord
  # validates :title, presence: true, length: { in: 2..20 }
  # validates :description, length: { maximum: 255 }
  # validates :price, presence: true, numericality: {greater_than: 0 }
  validates :title, presence: true
  belongs_to :user
  belongs_to :category
  has_many :cart_listings
  has_one_attached :picture
  has_many :carts, through: :cart_listings

  def price_display
    '$' + sprintf('%.2f', (self.price / 100.0))
  end
end
