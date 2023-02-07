

require 'rails_helper'

RSpec.describe 'Bikes Index' do
  before(:each) do
    @allcity = Manufacturer.create!(name: "All City", employees: 25, domestic: true)
    @special = Manufacturer.create!(name: "Specialized", employees: 1701, domestic: false)
    @surly = Manufacturer.create!(name: "Surly", employees:76, domestic: true)
    @horse = @allcity.bikes.create!(name: "Space Horse", wheelsize: 650, carbon: false)
    @monkey = @surly.bikes.create!(name: "Karate Monkey", wheelsize: 650, carbon: false)
    @roubaix = @special.bikes.create!(name: "Roubaix", wheelsize: 700, carbon: true)
    @stumpy = @special.bikes.create!(name: "Stump Jumper", wheelsize: 275, carbon: true)

  end

  describe 'users story 3' do
    it 'shows the name of all Bikes' do

      visit "/bikes/"
      expect(page).to have_content(@horse.name)
      expect(page).to have_content(@monkey.name)
      expect(page).to have_content(@roubaix.name)
    end
  end

  describe 'user story 15' do
    it 'has a link to page that only shows carbon bikes' do
      visit "/bikes"

      expect(page).to have_content(@horse.name)
      expect(page).to have_content(@monkey.name)
      expect(page).to have_content(@roubaix.name)

      click_link "Carbon Bikes"
      expect(current_path).to eq "/bikes"

      expect(page).to_not have_content(@monkey.name)
      expect(page).to_not have_content(@horse.name)
      expect(page).to have_content(@roubaix.name)
      expect(page).to have_content(@stumpy.name)
    end
  end
end