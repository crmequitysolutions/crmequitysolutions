class CreateRentalUnits < ActiveRecord::Migration[5.1]
  def change
    create_table :rental_units do |t|
      t.integer :rental_unit_id
      t.integer :property_id
      t.integer :bd_rms
      t.integer :ba_rms
      t.float :rent
      t.boolean :occupied_ind
      t.boolean :pay_heat_ind
      t.boolean :pay_wtr_ind
      t.boolean :pay_gas_ind
      t.boolean :pay_elec_ind
      t.integer :tenant

      t.timestamps
    end
  end
end
