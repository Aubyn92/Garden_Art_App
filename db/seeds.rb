# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all

puts "Seeded data successfully deleted"

puts "Seeding Users"

user_admin = User.create(email: 'admin@gardenart.com', password: 'password', admin: true)
user_1 = User.create(email: 'user1@gardenart.com', password: 'password')
user_2 = User.create(email: 'user2@gardenart.com', password: 'password')

puts "Users successfully seeded"

puts "Seeding Categories"

categories = ['Flowers', 'Figurines', 'Signage']

categories.each do |category|
  Category.create(
    name: category
  )
end

puts "Categories successfully seeded"

puts "Seeding Listings"

listings = [
  {
    name: 'Scallop Shell Poppy in Red',
    category: 'Flowers',
    price: '$35',
    description: 'Beautiful, hand-made poppy flower to add vibrancy to your garden. Made from scallop shells and fit together using construction grade glue, painted in a bright water-proof Red; these flowers are made for the outdoors. Fixed onto a solid steel stem, coated in waterproof Black.',
    user_id: '1'
  },
  {
    name: 'Scallop Shell Poppy in Purple',
    category: 'Flowers',
    price: '$35',
    description: 'Beautiful, hand-made poppy flower to add vibrancy to your garden. Made from scallop shells and fit together using construction grade glue, painted in a bright water-proof Purple; these flowers are made for the outdoors. Fixed onto a solid steel stem, coated in waterproof Black.',
    user_id: '1' 
  },
  {
    name: 'Scallop Shell Poppy in Orange',
    category: 'Flowers',
    price: '$35',
    description: 'Beautiful, hand-made poppy flower to add vibrancy to your garden. Made from scallop shells and fit together using construction grade glue, painted in a bright water-proof Orange; these flowers are made for the outdoors. Fixed onto a solid steel stem, coated in waterproof Black.',
    user_id: '1' 
  },
  {
    name: 'Alice in Wonderland Statue Art',
    category: 'Figurines',
    price: '$625 for the set of three',
    description: 'A trio of bronze hand-carved sculptues featuring characters from Alice In Wonderland, Dormouse, White Rabbit and the Mad Hatter.',
    user_id: '2'
  },
  {
    name: 'Resting Buddha',
    category: 'Figurines',
    price: '$125',
    description: 'Inspired from Ubud, Indonesia, this hand carved figurine statue is made from stone and represents peace and is a beuatiful addition to your garden.', 
    user_id: '2'
  },
  {
    name: 'Classic Garden Gnome',
    category: 'Figurines',
    price: '$45',
    description: 'Classic wee colourful gnome, with his lovely Red hat and all. What would a garden be without one.',
    user_id: '2' 
  },
  {
    name: 'Anti-Social Sign',
    category: 'Signage',
    price: '$40',
    description: 'For those who enjoy a peaceful garden. Hand-crafted and hand-scribbled wooden sign for the garden, ensuring tranquil surroundings.',
    user_id: '3' 
  },
  {
    name: 'Oxygen For Sale Sign',
    category: 'Signage',
    price: '$55',
    description: 'A serious sign for the garden, and a thoughtful concept. Black calligraphic style hand-writing on a metal slate, attached to rustic chain.',
    user_id: '3' 
  },
  {
    name: 'Secretive Garden Sign',
    category: 'Signage',
    price: '$35',
    description: 'Self-explanatory. A sign to show the way to a secret garden. Made from indistinct wood so as to not attract too much attention.',
    user_id: '3' 
  }
]

listings.each do |listing|
    Listing.create(
      name: listing[:name],
      category: listing[:category],
      price: listing[:price],
      description: listing[:description],
      user_id: listing[:user_id]
    )
end

puts "Listings successfully seeded"