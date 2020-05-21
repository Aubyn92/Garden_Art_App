class Listing < ApplicationRecord
  validates :title, presence: true # to ensure that a listing is not valid without a title attribute
  belongs_to :user
  belongs_to :category
  has_many :cart_listings
  has_one_attached :picture
  has_many :carts, through: :cart_listings
end
