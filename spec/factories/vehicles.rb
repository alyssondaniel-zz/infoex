FactoryBot.define do
  factory :vehicle do
    license_plate { Faker::Vehicle.vin }
    model { Faker::Vehicle.year }
    year { Faker::Vehicle.year }
  end
end
