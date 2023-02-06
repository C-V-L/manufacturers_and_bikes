require 'rails_helper'

RSpec.describe '#destroy' do
  describe 'user story 19' do
    it 'from the show page a user can delete a manufacturer' do
      @allcity = Manufacturer.create!(name: "All City", employees: 25, domestic: true)

      visit '/manufacturers'
      expect(page).to have_content('All City')

      visit "/manufacturers/#{@allcity.id}"

      click_button 'Delete Manufacturer'

      expect(current_path).to eq ("/manufacturers")
      expect(page).to_not have_content("All City")

    end


  end
end