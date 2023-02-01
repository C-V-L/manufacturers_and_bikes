require 'rails_helper'

RSpec.describe Manufacturer, type: :model do
  it {should have_many :bikes}
end
