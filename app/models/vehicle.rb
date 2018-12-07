class Vehicle < ApplicationRecord
  validates :license_plate, :model, :year, presence: true
end
