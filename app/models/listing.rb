class Listing < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_one_attached :picture
    validates :title, presence: true
    has_many :cart_listings, dependent: :destroy
    has_many :carts, through: :cart_listings
end
