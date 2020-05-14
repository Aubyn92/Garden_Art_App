class CreateCartListings < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_listings do |t|

      t.timestamps
    end
  end
end
