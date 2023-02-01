class Manufacturer < ApplicationRecord
  has_many :bikes, dependent: :destroy
end