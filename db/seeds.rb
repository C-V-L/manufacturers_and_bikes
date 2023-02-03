# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Manufacturer.destroy_all
Bike.destroy_all

# Manufacturers:
@allcity = Manufacturer.create!(name: "All City", employees: 25, domestic: true)
@special = Manufacturer.create!(name: "Specialized", employees: 1701, domestic: false)
@surly = Manufacturer.create!(name: "Surly", employees:76, domestic: true)

# Bikes:
@horse = @allcity.bikes.create!(name: "Space Horse", wheelsize: 650, carbon: false)
@gorrilla = @allcity.bikes.create!(name: "Gorrilla Monsoon", wheelsize: 700, carbon: false)
@stumpy = @special.bikes.create!(name: "Stump Jumper", wheelsize: 275, carbon: true)
@roubaix = @special.bikes.create!(name: "Roubaix", wheelsize: 700, carbon: true)
@tarmac = @special.bikes.create!(name: "Tarmax", wheelsize:650, carbon: false)
@trucker = @surly.bikes.create!(name: "Disc Trucker", wheelsize: 700, carbon: false)
@monkey = @surly.bikes.create!(name: "Karate Monkey", wheelsize: 650, carbon: false)
@bigblock = @allcity.bikes.create!(name: "Big Block", wheelsize: 275, carbon: false)

