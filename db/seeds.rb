# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.destroy_all
Product.destroy_all
Rental.destroy_all
puts "Cleared database"

max = User.create!(first_name: 'Max', last_name: 'Krieg', email: 'max@gmail.com', password: 'max123', city: 'Quincy', state: 'MA', zip: '02170')
puts "Created max"

alex = User.create!(first_name: 'Alex', last_name: 'Zito-Wold', email: 'alex@gmail.com', password: 'alex123', city: 'Cambridge', state: 'MA', zip: '02139')
puts "Created alex"

max_product = max.products.create!(title: 'therma-rest pad', description: 'very lightweight and versatile sleeping pad, ideal for someone short', daily_cost: '9.99', category: 'camping')
puts "added product to max"

alex_product = alex.products.create!(title: 'climbing rope', description: 'very strong rope, ideal for top roping', daily_cost: '20', category: 'climbing')
puts "added product to alex"

max_rental = alex_product.rentals.create!(user: max, product_title: 'climbing rope', start_date: '02/06/2015', end_date: '02/07/2015', total_cost: '75.67', status: 'pending', message: 'hey man I really love that rope!')
puts 'added rental to max'

alex_rental = max_product.rentals.create!(user: alex, product_title: 'therma-rest pad', start_date: '02/06/2015', end_date: '02/07/2015', total_cost: '125', status: 'pending', message: 'hey man I really love that rope!')
puts 'added rental to alex'
