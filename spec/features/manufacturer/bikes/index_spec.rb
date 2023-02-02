# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes
# (data from each column that is on the child table)

require 'rails_helper'

RSpec.describe 'Manufacturer Bikes Index' do
  it 'shows all the bikes associated with manufacturer' do
    @allcity = Manufacturer.create!(name: "All City", employees: 25, domestic: true)
    @horse = @allcity.bikes.create!(name: "Space Horse", wheelsize: 650, carbon: false)
    @gorrilla = @allcity.bikes.create!(name: "Gorrilla Monsoon", wheelsize: 700, carbon: false)
    @bigblock = @allcity.bikes.create!(name: "Big Block", wheelsize: 275, carbon: false)

    visit "/manufacturers/#{@allcity.id}/bikes"
    expect(page).to have_content(@allcity.name)
    expect(page).to have_content(@horse.name)
    expect(page).to have_content("Wheel Size: #{@horse.wheelsize}")
    expect(page).to have_content("Carbon: #{@horse.carbon}")
    expect(page).to have_content(@gorrilla.name)
    expect(page).to have_content("Wheel Size: #{@gorrilla.wheelsize}")
    expect(page).to have_content("Carbon: #{@gorrilla.carbon}")
    expect(page).to have_content(@bigblock.name)
    expect(page).to have_content("Wheel Size: #{@bigblock.wheelsize}")
    expect(page).to have_content("Carbon: #{@bigblock.carbon}")
  end
end
