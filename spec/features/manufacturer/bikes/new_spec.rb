require 'rails_helper'

RSpec.describe '#new' do
  describe 'user story 13' do
    before(:each) do
      @allcity = Manufacturer.create!(name: "All City", employees: 25, domestic: true)
    end

    it 'has a create button that takes the user to a page to create a new bike' do

      visit "/manufacturers/#{@allcity.id}/bikes"

      click_button "Create Bike"
      expect(current_path).to eq("/manufacturers/#{@allcity.id}/bikes/new")
    end

    it 'can create a new manufacturer' do
      visit "/manufacturers/#{@allcity.id}/bikes/new"

      fill_in('Name', with: 'Nature Cross')
      fill_in('Wheel Size', with: 700)
      fill_in('Carbon?', with: 'false')
      click_button ('Create Bike')

      new_bike_id = Bike.last.id 
      expect(current_path).to eq("/manufacturers/#{@allcity.id}")
      expect(page).to have_content('Nature Cross')
    end
  end
end