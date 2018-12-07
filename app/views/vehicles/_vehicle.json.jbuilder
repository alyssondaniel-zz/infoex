json.extract! vehicle, :id, :license_plate, :model, :year, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)
