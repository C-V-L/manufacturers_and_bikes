class Bike < ApplicationRecord
  belongs_to :manufacturer

  def self.filter_for_carbon
    where(:carbon => true)
  end
end