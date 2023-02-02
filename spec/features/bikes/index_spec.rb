# User Story 3, Child Index 

# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes
# (data from each column that is on the child table)

require 'rails_helper'

RSpec.describe 'Bikes Index' do
  it 'shows the name of all Bikes' do
    @allcity = Manufacturer.create!(name: "All City", employees: 25, domestic: true)
    @special = Manufacturer.create!(name: "Specialized", employees: 1701, domestic: false)
    @surly = Manufacturer.create!(name: "Surly", employees:76, domestic: true)
    @horse = @allcity.bikes.create!(name: "Space Horse", wheelsize: 650, carbon: false)
    @monkey = @surly.bikes.create!(name: "Karate Monkey", wheelsize: 650, carbon: false)
    @roubaix = @special.bikes.create!(name: "Roubaix", wheelsize: 700, carbon: true)

    visit "/bikes/"
    expect(page).to have_content(@horse.name)
    expect(page).to have_content(@monkey.name)
    expect(page).to have_content(@roubaix.name)

  end
end