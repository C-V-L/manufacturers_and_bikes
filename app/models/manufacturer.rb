class Manufacturer < ApplicationRecord
  # validates_presence_of :name
  # validates_presence_of :employees
  # validates_presence_of :domestic

  has_many :bikes, dependent: :destroy

  def self.sort_by_created_at
    order(created_at: :desc)
  end

  def bike_count
    bikes.count
  end
end