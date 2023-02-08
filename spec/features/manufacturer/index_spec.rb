require 'rails_helper'

RSpec.describe 'Manufacturer Index' do

  before(:each) do
  @allcity = Manufacturer.create!(name: "All City", employees: 25, domestic: true, created_at: Time.now - 1.day)
  @special = Manufacturer.create!(name: "Specialized", employees: 1701, domestic: false, created_at: Time.now - 1.hour)
  @surly = Manufacturer.create!(name: "Surly", employees:76, domestic: true)
  end

  describe 'user story 1' do
    it 'lists all the manufacturers' do
      visit "/manufacturers/"
      expect(page).to have_content(@allcity.name)
      expect(page).to have_content(@special.name)
      expect(page).to have_content(@surly.name)
    end
  end

  describe 'user story 6' do
    it 'orders the manufacturers by the newest created_at and displays created_at' do

      visit "/manufacturers/"

      expect(@surly.name).to appear_before(@special.name)
      expect(@special.name).to appear_before(@allcity.name)
    end
  end

  describe 'user story 17' do
    it 'next to each manufacturer is a link to their update page' do 
      visit "/manufacturers/" 

      expect(page).to have_link "Update #{@allcity.name}"
      expect(page).to have_link "Update #{@special.name}"
      expect(page).to have_link "Update #{@surly.name}"

      click_link "Update #{@allcity.name}"
      expect(current_path).to eq "/manufacturers/#{@allcity.id}/edit"
    end
  end
  
  describe 'user story 21' do
    it 'next to each manufacturer is a link to their update page' do 
      visit "/manufacturers/" 

      expect(page).to have_content @allcity.name
      expect(page).to have_link "Delete #{@allcity.name}"
      expect(page).to have_link "Delete #{@special.name}"
      expect(page).to have_link "Delete #{@surly.name}"

      click_link "Delete #{@allcity.name}"
      expect(current_path).to eq "/manufacturers"
      expect(page).to_not have_content @allcity.name
    end
  end
end
