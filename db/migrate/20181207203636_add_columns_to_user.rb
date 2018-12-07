class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :admission_date, :date
    add_column :users, :resignation_date, :date
  end
end
