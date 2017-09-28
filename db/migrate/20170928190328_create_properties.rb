class CreateProperties < ActiveRecord::Migration[5.1]
  def change
    create_table :properties do |t|
      t.integer :property_id
      t.integer :address_id
      t.integer :owner
      t.string :property_type
      t.string :time_on_mrkt
      t.string :construction
      t.boolean :basement_ind
      t.boolean :public_water_ind
      t.boolean :offstreet_parking_ind
      t.boolean :main_st_ind
      t.boolean :garage_ind
      t.float :sqft
      t.integer :yr_built
      t.integer :bd_rms
      t.integer :ba_rms
      t.integer :rooms
      t.datetime :kitch_reno_date
      t.datetime :bath_reno_date
      t.string :roof_type
      t.string :roof_age
      t.boolean :roof_leaks_ind
      t.string :plumb_type
      t.string :plumb_age
      t.boolean :plumb_leak_ind
      t.string :foundation
      t.string :heat_type
      t.string :heat_age
      t.boolean :heat_works
      t.string :cool_type
      t.string :cool_age
      t.boolean :cool_works
      t.string :window_type
      t.integer :window_nbr
      t.string :resn_to_sell
      t.boolean :agnt_list_ind
      t.datetime :agnt_exp_date
      t.float :quick_close_amt
      t.float :amt_owed
      t.boolean :pymnt_crnt
      t.float :pymt_amt
      t.boolean :tax_inc_ind
      t.float :interest_rate
      t.boolean :pymnt_asum_ind
      t.datetime :sell_by_date
      t.boolean :bck_tx_ind
      t.float :bkd_tx_amt

      t.timestamps
    end
  end
end
