# User Story 1, Parent Index 

# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system

require 'rails_helper'

RSpec.describe 'Manufacturer Index' do
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