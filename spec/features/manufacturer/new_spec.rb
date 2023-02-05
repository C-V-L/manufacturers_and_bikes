require 'rails_helper'

RSpec.describe '#new' do
  describe 'user story 11' do
    it 'links to the new page from the manufacturers index' do
      visit '/manufacturers'

      click_link('New Manufacturer')
      expect(current_path).to eq('/manufacturers/new')

    end

    it 'can create a new manufacturer' do
      visit '/manufacturers/new'

      fill_in('Name', with: 'Giant')
      fill_in('employees', with: 156)
      fill_in('domestic', with: 'false')
      click_button ('Create Manufacturer')

      new_manufacturer_id = Manufacturer.last.id 
      expect(current_path).to eq("/manufacturers/#{new_manufacturer_id}")
      expect(page).to have_content('Giant')
      expect(page).to have_content("Number of Employees: #{Manufacturer.last.employees}")
      expect(page).to have_content("Domestic: #{Manufacturer.last.domestic}")

    end
  end
end