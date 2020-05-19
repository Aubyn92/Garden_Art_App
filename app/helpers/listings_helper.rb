# module ListingsHelper
#     def picture_for(listing)
#         return "
#           background: url(#{url_for(listing.picture)});
#           height: 100%; 
#           background-position: center; 
#           background-size: cover;
#         "
#     end    
# end

module ListingsHelper
  def picture_for(listing)
    if listing.picture.present?
      listing.picture
    else
      'red-pop.jpg'
    end
  end
end