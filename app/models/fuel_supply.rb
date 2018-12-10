class FuelSupply < ApplicationRecord
  belongs_to :vehicle

  scope :search, lambda {|start_date, end_date| where("date_supply >= ? AND date_supply <= ?", start_date, end_date )}
  scope :avg_per_period, -> { joins(:vehicle).
                              select('
                                vehicles.license_plate AS license_plate,
                                AVG(price) AS price,
                                AVG(quantity) AS quantity,
                                (AVG(price) / AVG(quantity)) AS liter').
                              group('license_plate') }
end
