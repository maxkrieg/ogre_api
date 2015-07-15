# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
@file_one = Rack::Test::UploadedFile.new(Rails.root + 'starter_images/image01.jpg', 'image/jpg')
@file_two = Rack::Test::UploadedFile.new(Rails.root + 'starter_images/image02.jpg', 'image/jpg')
@file_three = Rack::Test::UploadedFile.new(Rails.root + 'starter_images/image03.jpg', 'image/jpg')

User.destroy_all
Product.destroy_all
Rental.destroy_all
puts "Cleared database"

## Create Users ###
max = User.create!(first_name: 'Max', last_name: 'Krieg', email: 'max@gmail.com', password: 'max123', city: 'Quincy', state: 'MA', zip: '02170')
puts "Created max"

alex = User.create!(first_name: 'Alex', last_name: 'Zito-Wold', email: 'alex@gmail.com', password: 'alex123', city: 'Cambridge', state: 'MA', zip: '02139')
puts "Created alex"

## Max Products
max_product = max.products.create!(title: 'therma-rest pad', description: 'very lightweight and versatile sleeping pad, ideal for someone short', daily_cost: '9.99', category: 'camping', image: @file_one)

max_productTwo = max.products.create!(title: 'REI tent', description: 'great, sturdy tent.  Made for three seasons', daily_cost: '30', category: 'camping', image: @file_two)

max_productThree = max.products.create!(title: 'Hiking Poles', description: 'made for tall people, generally awesome and lightweight', daily_cost: '10', category: 'hiking', image: @file_three)
puts "added products to max"

## Alex Products
alex_product = alex.products.create!(title: 'climbing rope', description: 'very strong rope, ideal for top roping', daily_cost: '20', category: 'climbing', image: @file_one)

alex_productTwo = alex.products.create!(title: 'Snowshoes', description: 'Size 10 snowshoes by REI, really strong and secure.', daily_cost: '15.60', category: 'snowshoeing', image: @file_two)

alex_productThree = alex.products.create!(title: 'Kayaks', description: 'Two sea kayaks for rent, with spray skirts.  One is a double.', daily_cost: '19.75', category: 'sea kayaking', image: @file_three)
puts "added products to alex"

## Max Rentals
max_rental = alex_product.rentals.create!(user: max, start_date: '02/06/2015', end_date: '02/07/2015', total_cost: '75.67', status: 'pending', message: 'hey man I really love that rope!')

max_rental = alex_productTwo.rentals.create!(user: max, start_date: '02/06/2015', end_date: '02/07/2015', total_cost: '75.67', status: 'pending', message: 'hey man I really love that rope!')

max_rental = alex_productThree.rentals.create!(user: max, start_date: '02/06/2015', end_date: '02/07/2015', total_cost: '75.67', status: 'pending', message: 'hey man I really love that rope!')
puts 'added rentals to max'

## Alex Rentals
alex_rental = max_product.rentals.create!(user: alex, start_date: '02/06/2015', end_date: '02/07/2015', total_cost: '125', status: 'pending', message: 'hey man I really love that rope!')

alex_rental = max_productTwo.rentals.create!(user: alex, start_date: '02/06/2015', end_date: '02/07/2015', total_cost: '125', status: 'pending', message: 'hey man I really love that rope!')

alex_rental = max_productThree.rentals.create!(user: alex, start_date: '02/06/2015', end_date: '02/07/2015', total_cost: '125', status: 'pending', message: 'hey man I really love that rope!')
puts 'added rentals to alex'
