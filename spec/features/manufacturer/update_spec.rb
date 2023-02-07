require 'rails_helper'

RSpec.describe 'update' do
  describe 'user story 12' do
    it 'links to the edit page' do
      @allcity = Manufacturer.create!(name: "All City", employees: 25, domestic: true)

      visit "/manufacturers/#{@allcity.id}"

      click_button "Update Manufacturer"
      
      expect(current_path).to eq("/manufacturers/#{@allcity.id}/edit")
    end

    it 'can edit the manufacturer' do
      @allcity = Manufacturer.create!(name: "Some City", employees: 25, domestic: true)

      visit "/manufacturers/#{@allcity.id}"

      expect(page).to have_content("Some City")

      visit "/manufacturers/#{@allcity.id}/edit"

      fill_in "Name", with: "All City"
      click_button  "Update Manufacturer"

      expect(current_path).to eq("/manufacturers/#{@allcity.id}")
      expect(page).to have_content("All City")
    end
  end
end