# As a visitor
# When I visit '/parents/:parent_id/child_table_name'
# Then I see each Child that is associated with that Parent with each Child's attributes
# (data from each column that is on the child table)

require 'rails_helper'

RSpec.describe 'Manufacturer Bikes Index' do
  before(:each) do
    @allcity = Manufacturer.create!(name: "All City", employees: 25, domestic: true)
    @horse = @allcity.bikes.create!(name: "Space Horse", wheelsize: 650, carbon: false)
    @gorrilla = @allcity.bikes.create!(name: "Gorrilla Monsoon", wheelsize: 700, carbon: false)
    @bigblock = @allcity.bikes.create!(name: "Big Block", wheelsize: 275, carbon: false)
  end
  
  describe 'user story 5' do
    it 'shows all the bikes associated with manufacturer' do

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

  describe 'user story 16' do
    it 'has a button to sort the manufacturers bikes index alphabetically' do
      visit "/manufacturers/#{@allcity.id}/bikes"

      expect(@horse.name).to appear_before(@bigblock.name)

      click_link "Sort Bikes Alphabetically"

      expect(@bigblock.name).to appear_before(@horse.name)
    end
  end

  describe 'user story 18' do
    it 'next to each bike is a link to its edit page' do 
      visit "manufacturers/#{@allcity.id}/bikes"

      expect(page).to have_link "Update #{@horse.name}"
      expect(page).to have_link "Update #{@bigblock.name}"
      expect(page).to have_link "Update #{@gorrilla.name}"

      click_link "Update #{@horse.name}"

      expect(current_path).to eq "/bikes/#{@horse.id}/edit"
    end
  end

end
