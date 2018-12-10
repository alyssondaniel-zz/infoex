class CreateFuelSupplies < ActiveRecord::Migration[5.2]
  def change
    create_table :fuel_supplies do |t|
      t.date :date_supply
      t.integer :quantity
      t.numeric :price
      t.references :vehicle, foreign_key: true

      t.timestamps
    end
  end
end
