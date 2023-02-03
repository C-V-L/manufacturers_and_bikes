require 'rails_helper'

RSpec.describe Manufacturer, type: :model do
  before do 
    Manufacturer.destroy_all
  end

  describe 'parent-child relationship' do
    it {should have_many :bikes}
  end

  describe 'user story 6' do
    describe '#sort_by_created_at' do
      it 'sorts the records by the most recent created_at timestamp' do
        @surly = Manufacturer.create!(name: "Surly", employees:76, domestic: true)
        @special = Manufacturer.create!(name: "Specialized", employees: 1701, domestic: false, created_at: Time.now - 1.hour)
        @allcity = Manufacturer.create!(name: "All City", employees: 25, domestic: true, created_at: Time.now - 1.day)
        
        expect(Manufacturer.sort_by_created_at.to_a).to eq([@surly,@special,@allcity ])
      end

    end
  end

  describe 'user story 7' do
    describe '#bike_count' do
      it 'returns the number of bikes the manufacturer has' do
        @surly = Manufacturer.create!(name: "Surly", employees:76, domestic: true, created_at: Time.now - 1.hour)
        @trucker = @surly.bikes.create!(name: "Disc Trucker", wheelsize: 700, carbon: false)
        @monkey = @surly.bikes.create!(name: "Karate Monkey", wheelsize: 650, carbon: false)
        @bigblock = @surly.bikes.create!(name: "Big Block", wheelsize: 275, carbon: false)

        expect(@surly.bike_count).to eq(3)
      end
    end
  end

end