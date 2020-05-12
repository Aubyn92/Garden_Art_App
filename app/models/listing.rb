class Listing < ApplicationRecord
    belongs_to :user
    has_one_attached :picture
    validates :title, presence: true
    has_many :cart_listings
    has_many :carts, through: :cart_listings
end
