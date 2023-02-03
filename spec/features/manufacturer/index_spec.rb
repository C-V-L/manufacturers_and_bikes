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

end
