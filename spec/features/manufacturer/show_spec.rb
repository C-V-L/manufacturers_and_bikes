# User Story 2, Parent Show 

# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes
# (data from each column that is on the parent table)

require 'rails_helper'

RSpec.describe 'Manufacturer Show' do
  it 'shows the attributes of all manufacturers' do
    @allcity = Manufacturer.create!(name: "All City", employees: 25, domestic: true)
    @special = Manufacturer.create!(name: "Specialized", employees: 1701, domestic: false)

    visit "/manufacturers/#{@allcity.id}"
    expect(page).to have_content(@allcity.name)
    expect(page).to have_content("Employees: #{@allcity.employees}")
    expect(page).to have_content("Domestic: #{@allcity.domestic}")
    expect(page).to_not have_content(@special.name)
    expect(page).to_not have_content("Employees: #{@special.employees}")
    expect(page).to_not have_content("Domestic: #{@special.domestic}")

  end
end