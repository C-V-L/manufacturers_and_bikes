require 'rails_helper'

RSpec.describe Bike, type: :model do
  before(:each) do
    @surly = Manufacturer.create!(name: "Surly", employees:76, domestic: true, created_at: Time.now - 1.hour)
    @allcity = Manufacturer.create!(name: "All City", employees: 25, domestic: true, created_at: Time.now - 1.day)
    @special = Manufacturer.create!(name: "Specialized", employees: 1701, domestic: false)
    @horse = @allcity.bikes.create!(name: "Space Horse", wheelsize: 650, carbon: false)
    @gorrilla = @allcity.bikes.create!(name: "Gorrilla Monsoon", wheelsize: 700, carbon: false)
    @stumpy = @special.bikes.create!(name: "Stump Jumper", wheelsize: 275, carbon: true)
    @roubaix = @special.bikes.create!(name: "Roubaix", wheelsize: 700, carbon: true)
    @tarmac = @special.bikes.create!(name: "Tarmax", wheelsize:650, carbon: false)
    @trucker = @surly.bikes.create!(name: "Disc Trucker", wheelsize: 700, carbon: false)
    @monkey = @surly.bikes.create!(name: "Karate Monkey", wheelsize: 650, carbon: false)
    @bigblock = @allcity.bikes.create!(name: "Big Block", wheelsize: 275, carbon: false)
  end

  it {should belong_to :manufacturer}

  describe '#filter_for_carbon' do
    it 'can return bikes which carbon is true' do 
      expect(Bike.filter_for_carbon).to eq [@stumpy, @roubaix]
    end
  end

  describe '#sort_alphabettically' do
    it 'sorts bikes alphabetically by name' do
      expect(Bike.sort_alphabetically).to eq([@bigblock, @trucker, @gorrilla, @monkey, @roubaix, @horse, @stumpy, @tarmac])
    end
  end

end
