class Bike < ApplicationRecord
  belongs_to :manufacturer

  def self.filter_for_carbon
    where(:carbon => true)
  end

  def self.sort_alphabetically
    order(:name)
  end

  def self.filter_by_wheelsize(wheelsize)
    size = wheelsize.to_i
    where("wheelsize >= #{size}")
  end
end