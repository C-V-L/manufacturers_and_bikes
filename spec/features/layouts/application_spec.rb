require 'rails_helper'

RSpec.describe 'Application display' do
  describe 'user story 9' do
    it 'displays a link to the child index page from every page' do
      @surly = Manufacturer.create!(name: "Surly", employees:76, domestic: true, created_at: Time.now - 1.hour)
      @trucker = @surly.bikes.create!(name: "Disc Trucker", wheelsize: 700, carbon: false)
      @monkey = @surly.bikes.create!(name: "Karate Monkey", wheelsize: 650, carbon: false)
      @bigblock = @surly.bikes.create!(name: "Big Block", wheelsize: 275, carbon: false)

      visit "/manufacturers/"
      expect(page).to have_link("Bikes")
      expect(page).to have_link("Manufacturers")

      visit "/bikes/"
      expect(page).to have_link("Manufacturers")
      expect(page).to have_link("Bikes")

    end
  end
end
