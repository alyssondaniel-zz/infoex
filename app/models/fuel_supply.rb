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
  scope :rank, -> { joins(:vehicle).
                    select('
                      vehicles.license_plate AS license_plate,
                      SUM(quantity) AS quantity,
                      SUM(price) AS price,
                      (SUM(price) / SUM(quantity)) AS liter').
                    where("date_supply >= ? AND date_supply <= ?",
                      Date.today.beginning_of_month.strftime("%Y-%m-%d"),
                      Date.today.end_of_month.strftime("%Y-%m-%d") ).
                    group('vehicles.license_plate').
                    order("fuel_supplies.quantity ASC") }
end
