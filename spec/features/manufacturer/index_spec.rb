# User Story 1, Parent Index 

# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system

require 'rails_helper'

RSpec.describe 'Manufacturer Index' do
  describe 'user story 1' do
    it 'shows the name of all manufacturers' do
      @allcity = Manufacturer.create!(name: "All City", employees: 25, domestic: true)
      @special = Manufacturer.create!(name: "Specialized", employees: 1701, domestic: false)

      # horse = allcity.bikes.create!(name: "Space Horse", wheelsize: 650, carbon: false)
      # gorrilla = allcity.bikes.create!(name: "Gorrilla Monsoon", wheelsize: 700, carbon: false)

      visit "/manufacturers/"
      expect(page).to have_content(@allcity.name)
      expect(page).to have_content(@special.name)
    end
  end

  describe 'user story 6' do
    it 'orders the manufacturers by the newest created_at and displays created_at' do
      @allcity = Manufacturer.create!(name: "All City", employees: 25, domestic: true, created_at: Time.now - 1.day)
      @special = Manufacturer.create!(name: "Specialized", employees: 1701, domestic: false, created_at: Time.now - 1.hour)
      @surly = Manufacturer.create!(name: "Surly", employees:76, domestic: true)

      visit "/manufacturers/"

      expect(@surly.name).to appear_before(@special.name)
      expect(@special.name).to appear_before(@allcity.name)
    end
  end

  describe 'user story 8 & 9' do
    it 'displays a link to the child index page from every page' do
      @surly = Manufacturer.create!(name: "Surly", employees:76, domestic: true, created_at: Time.now - 1.hour)
      @trucker = @surly.bikes.create!(name: "Disc Trucker", wheelsize: 700, carbon: false)
      @monkey = @surly.bikes.create!(name: "Karate Monkey", wheelsize: 650, carbon: false)
      @bigblock = @surly.bikes.create!(name: "Big Block", wheelsize: 275, carbon: false)

      visit "/manufacturers/"
      expect(page).to have_link("Bikes")
      expect(page).to have_link("Manufacturers")

      visit "/bikes/"
      expect(page).to have_link("Manufacturers")
      expect(page).to have_link("Bikes")

    end
  end
end
