module ListingsHelper
  def picture_for(listing)
    if listing.picture.present?
      listing.picture
    else
      asset_path 'red-pop.jpg'
    end
  end
end