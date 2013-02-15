class CreateEstates < ActiveRecord::Migration
  def change
    create_table :estates do |t|
      t.string :estate_code
      t.string :service_charge_period
      t.string :due_dates

      t.timestamps
    end
  end
end
