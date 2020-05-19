class Category < ApplicationRecord
    # validates :name, presence: true, length: { in: 2..20 }
    has_many :listings
    validates :name, presence: true

    def self.search(search)
        if search
            listing_type = Listing.find(title: search)
            if listing_type 
                self.where(listing_id: listing_type)
            else
                @categories = Category.all
            end
        else
            @categories = Category.all
        end
    end

end
