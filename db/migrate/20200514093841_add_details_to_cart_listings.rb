class AddDetailsToCartListings < ActiveRecord::Migration[6.0]
  def change
    add_column :cart_listings, :quantity, :integer
    add_column :cart_listings, :listing_id, :integer
    add_column :cart_listings, :cart_id, :integer
    add_column :cart_listings, :order_id, :integer
  end
end
