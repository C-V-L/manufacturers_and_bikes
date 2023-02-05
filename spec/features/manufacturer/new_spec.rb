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

      new_manufacturer_id = Manufacturer.last.id 
      expect(current_path).to eq("/manufacturers")
      expect(page).to have_content('Giant')
    end
  end
end