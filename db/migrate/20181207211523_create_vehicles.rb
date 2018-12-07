class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :license_plate
      t.integer :model
      t.integer :year

      t.timestamps
    end
  end
end
