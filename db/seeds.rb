# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# User.destroy_all

puts "Seeded data successfully deleted"

User.destroy_all
puts "Seeding Users"
user = User.create(email: 'admin@gardenart.com', password: 'password', admin: true)
user_1 = User.create(email: 'user1@gardenart.com', password: 'password')
user_2 = User.create(email: 'user2@gardenart.com', password: 'password')
puts "Users successfully created"


puts "Seeding Categories"
categories = ['Flowers', 'Figurines', 'Signage']
categories.each do |category|
  Category.create(
    name: category
  )
end

puts "Categories successfully created"

Listing.destroy_all
puts "Seeding Listings"

listings = [
  {
    title: 'Scallop Shell Poppy in Red',
    category_id: 1,
    price: 35,
    description: 'Beautiful, hand-made poppy flower to add vibrancy to your garden. Made from scallop shells and fit together using construction grade glue, painted in a bright water-proof Red; these flowers are made for the outdoors. Fixed onto a solid steel stem, coated in waterproof Black.',
    sold: false
  },
  {
    title: 'Alice in Wonderland Trio',
    category_id: 2,
    price: 625,
    description: 'A trio of bronze hand-carved sculptues featuring characters from Alice In Wonderland, Dormouse, White Rabbit and the Mad Hatter.',
    sold: false
  },
  {
    title: 'Resting Buddha',
    category_id: 2,
    price: 125,
    description: 'Inspired from Ubud, Indonesia, this hand carved figurine statue is made from stone and represents peace and is a beuatiful addition to your garden.',
    sold: false
  },
  {
    title: 'Secret Garden Sign',
    category_id: 3,
    price: 35,
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    sold: false
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
  p listing
  p listing.errors.full_messages
end

puts "Listings successfully seeded"

puts "Total number of listings: #{Listing.all.count}"
puts "Listing titles: #{Listing.all.pluck("title")}"

