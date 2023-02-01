require 'rails_helper'

RSpec.describe 'the bikes show page' do
  it 'displays the bikes name' do
    manufacturer = Manufacturer.create(name: "All City")
    bike = manufacturer.bikes.create!(name: "Space Horse", wheelsize: 650, carbon: false)
    bike_2 = manufacturer.bikes.create!(name: "Cosmic Stallion", wheelsize: 700, carbon: false)

    visit "/bikes/#{bike.id}"

    expect(page).to have_content(bike.name)
    expect(page).to_not have_content(bike_2.name)
  end

  it 'displays the name of the manufacturer' do
    manufacturer = Manufacturer.create(name: "All City")
    bike = manufacturer.bikes.create!(name: "Space Horse", wheelsize: 650, carbon: false)
    bike_2 = manufacturer.bikes.create!(name: "Cosmic Stallion", wheelsize: 700, carbon: false)

    visit "/bikes/#{bike.id}"
    save_and_open_page
    expect(page).to have_content(manufacturer.name)
  end

end