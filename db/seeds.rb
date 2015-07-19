# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
@therma_rest = Rack::Test::UploadedFile.new(Rails.root + 'starter_images/therma-rest.jpg', 'image/jpg')
@rei_tent = Rack::Test::UploadedFile.new(Rails.root + 'starter_images/rei-tent.jpg', 'image/jpg')
@hiking_poles = Rack::Test::UploadedFile.new(Rails.root + 'starter_images/hiking-poles.jpg', 'image/jpg')
@climbing_rope = Rack::Test::UploadedFile.new(Rails.root + 'starter_images/climbing-rope.jpg', 'image/jpg')
@snowshoes = Rack::Test::UploadedFile.new(Rails.root + 'starter_images/snowshoes.jpg', 'image/jpg')
@kayak = Rack::Test::UploadedFile.new(Rails.root + 'starter_images/kayak.jpg', 'image/jpg')

User.destroy_all
Product.destroy_all
Rental.destroy_all
puts "Cleared database"

## Create Users ###
max = User.create!(first_name: 'Max', last_name: 'Krieg', email: 'max@gmail.com', password: 'max123', city: 'Quincy', state: 'MA', zip: '02170')
puts "Created max"

alex = User.create!(first_name: 'Alex', last_name: 'Zito-Wolf', email: 'alex@gmail.com', password: 'alex123', city: 'Cambridge', state: 'MA', zip: '02139')
puts "Created alex"

## Max Products
max_product = max.products.create!(title: 'Therma-Rest Pad', description: 'very lightweight and versatile sleeping pad, ideal for someone short', daily_cost: '9.99', category: 'Camping', image: @therma_rest)

max_productTwo = max.products.create!(title: 'REI tent', description: 'great, sturdy tent.  Made for three seasons', daily_cost: '30', category: 'Camping', image: @rei_tent)

max_productThree = max.products.create!(title: 'Hiking Poles', description: 'made for tall people, generally awesome and lightweight', daily_cost: '10', category: 'Hiking', image: @hiking_poles)
puts "added products to max"

## Alex Products
alex_product = alex.products.create!(title: 'Climbing Rope', description: 'very strong rope, ideal for top roping', daily_cost: '20', category: 'Climbing', image: @climbing_rope)

alex_productTwo = alex.products.create!(title: 'Snowshoes', description: 'Size 10 snowshoes by REI, really strong and secure.', daily_cost: '15.60', category: 'Snowshoeing', image: @snowshoes)

alex_productThree = alex.products.create!(title: 'Kayaks', description: 'Two sea kayaks for rent, with spray skirts.  One is a double.', daily_cost: '19.75', category: 'Kayaking', image: @kayak)
puts "added products to alex"

## Max Rentals
max_rental = alex_product.rentals.create!(user: max, start_date: '02/06/2015', end_date: '02/07/2015', total_cost: '75.67', status: 'pending', message: 'That rope lookes great.  How much weight can it bear?')

max_rental = alex_productTwo.rentals.create!(user: max, start_date: '02/06/2015', end_date: '02/07/2015', total_cost: '75.67', status: 'pending', message: 'Snow shoes look awesome, are they solid on ice?')

max_rental = alex_productThree.rentals.create!(user: max, start_date: '02/06/2015', end_date: '02/07/2015', total_cost: '75.67', status: 'pending', message: 'Is the other kayak exactly the same as that one?  How is the storage?')
puts 'added rentals to max'

## Alex Rentals
alex_rental = max_product.rentals.create!(user: alex, start_date: '02/06/2015', end_date: '02/07/2015', total_cost: '125', status: 'pending', message: 'Looks like a great pad.  Is it light, and can you sleep on rocks?')

alex_rental = max_productTwo.rentals.create!(user: alex, start_date: '02/06/2015', end_date: '02/07/2015', total_cost: '125', status: 'pending', message: 'How easy is the tent to set up? Does it have sleeves for the poles or clips?')

alex_rental = max_productThree.rentals.create!(user: alex, start_date: '02/06/2015', end_date: '02/07/2015', total_cost: '125', status: 'pending', message: 'Are those poles made of titanium?')
puts 'added rentals to alex'
