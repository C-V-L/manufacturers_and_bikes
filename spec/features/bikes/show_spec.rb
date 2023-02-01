require 'rails_helper'

RSpec.describe 'the bikes show page' do
  it 'displays the bikes name' do
    manufacturer = Manufacturer.create(name: "All City")
    bike = Bike.create(name: "Space Horse", wheelsize: 650, carbon: false)
    visit "/bikes/#{bike.id}"
  end
end