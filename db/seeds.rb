# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.destroy_all

puts "Seeded data successfully deleted"

puts "Seeding Users"

# user_admin = User.create(email: 'admin@gardenart.com', password: 'password', admin: true)
# user_1 = User.create(email: 'user1@gardenart.com', password: 'password')
# user_2 = User.create(email: 'user2@gardenart.com', password: 'password')

puts "Users successfully seeded"

puts "Seeding Categories"

categories = ['Flowers', 'Figurines', 'Signage']

# categories.each do |category|
#   Category.create(
#     name: category
#   )
# end

puts "Categories successfully seeded"

puts "Seeding Listings"

listings = [
  {
    title: 'Scallop Shell Poppy in Red',
    category_id: 1,
    price: 3500,
    description: 'Beautiful, hand-made poppy flower to add vibrancy to your garden. Made from scallop shells and fit together using construction grade glue, painted in a bright water-proof Red; these flowers are made for the outdoors. Fixed onto a solid steel stem, coated in waterproof Black.'
  },
  {
    title: 'Scallop Shell Poppy in Purple',
    category_id: 1,
    price: 3500,
    description: 'Beautiful, hand-made poppy flower to add vibrancy to your garden. Made from scallop shells and fit together using construction grade glue, painted in a bright water-proof Purple; these flowers are made for the outdoors. Fixed onto a solid steel stem, coated in waterproof Black.' 
  },
  {
    title: 'Scallop Shell Poppy in Orange',
    category_id: 1,
    price: 3500,
    description: 'Beautiful, hand-made poppy flower to add vibrancy to your garden. Made from scallop shells and fit together using construction grade glue, painted in a bright water-proof Orange; these flowers are made for the outdoors. Fixed onto a solid steel stem, coated in waterproof Black.' 
  },
  {
    title: 'Alice in Wonderland Statue Art',
    category_id: 2,
    price: 62500,
    description: 'A trio of bronze hand-carved sculptues featuring characters from Alice In Wonderland, Dormouse, White Rabbit and the Mad Hatter.'
  },
  {
    title: 'Resting Buddha',
    category_id: 2,
    price: 1250,
    description: 'Inspired from Ubud, Indonesia, this hand carved figurine statue is made from stone and represents peace and is a beuatiful addition to your garden.'
  },
  {
    title: 'Classic Garden Gnome',
    category_id: 2,
    price: 4500,
    description: 'Classic wee colourful gnome, with his lovely Red hat and all. What would a garden be without one.'
  },
  {
    title: 'Anti-Social Sign',
    category_id: 3,
    price: 4000,
    description: 'For those who enjoy a peaceful garden. Hand-crafted and hand-scribbled wooden sign for the garden, ensuring tranquil surroundings.' 
  },
  {
    title: 'Oxygen For Sale Sign',
    category_id: 3,
    price: 5500,
    description: 'A serious sign for the garden, and a thoughtful concept. Black calligraphic style hand-writing on a metal slate, attached to rustic chain.' 
  },
  {
    title: 'Secretive Garden Sign',
    category_id: 3,
    price: 3500,
    description: 'Self-explanatory. A sign to show the way to a secret garden. Made from indistinct wood so as to not attract too much attention.' 
  }
]

listings.each do |listing|
   listing = Listing.create(
     title: listing[:title],
     category_id: listing[:category_id],
     price: listing[:price],
     description: listing[:description],
     user_id: User.first.id
  )
end

puts "Listings successfully seeded"