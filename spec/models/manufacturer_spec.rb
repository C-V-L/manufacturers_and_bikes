require 'rails_helper'

RSpec.describe Manufacturer, type: :model do
  before do 
    Manufacturer.destroy_all
  end

  describe 'parent-child relationship' do
    it {should have_many :bikes}
  end

  describe '#sort_by_created_at' do
    # User Story 6, Parent Index sorted by Most Recently Created 
    # As a visitor
    # When I visit the parent index,
    # I see that records are ordered by most recently created first
    # And next to each of the records I see when it was created

    it 'sorts the records by the most recent created_at timestamp' do
      @surly = Manufacturer.create!(name: "Surly", employees:76, domestic: true)
      @special = Manufacturer.create!(name: "Specialized", employees: 1701, domestic: false, created_at: Time.now - 1.hour)
      @allcity = Manufacturer.create!(name: "All City", employees: 25, domestic: true, created_at: Time.now - 1.day)
      
      expect(Manufacturer.sort_by_created_at.to_a).to eq([@surly,@special,@allcity])
    end
  end

end