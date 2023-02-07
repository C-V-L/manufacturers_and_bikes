require 'rails_helper'

RSpec.describe '#update' do
    before(:each) do
      @allcity = Manufacturer.create!(name: "All City", employees: 25, domestic: true)
      @horse = @allcity.bikes.create!(name: "Space Horsey", wheelsize: 650, carbon: false)

    end
  describe 'user story 14' do
    it 'has an update bike button that routes to an edit page' do
      visit "/bikes/#{@horse.id}"
      expect(page).to have_content "Space Horsey"

      click_link('Update Bike')
      expect(current_path).to eq("/bikes/#{@horse.id}/edit")

    end
    
    it "allows a user to update the bike's data" do
      visit "/bikes/#{@horse.id}/edit"

      fill_in "Name", with: "Space Horse"
      click_button "Update Bike"

      expect(current_path).to eq "/bikes/#{@horse.id}"
      expect(page).to have_content "Space Horse"
      
    end


  end
end
