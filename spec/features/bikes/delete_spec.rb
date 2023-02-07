require 'rails_helper'

RSpec.describe '#destroy' do
  describe 'user story 20' do
    it 'from the show page a user can delete a manufacturer' do
      @allcity = Manufacturer.create!(name: "All City", employees: 25, domestic: true)
      @horse = @allcity.bikes.create!(name: "Space Horse", wheelsize: 650, carbon: false)

      visit "/bikes"

      expect(page).to have_content(@horse.name)

      click_link "Space Horse"

      expect(current_path).to eq "/bikes/#{@horse.id}"

      click_button 'Delete Bike'

      expect(current_path).to eq("/bikes")
      expect(page).to_not have_content(@horse.name)

    end


  end
end