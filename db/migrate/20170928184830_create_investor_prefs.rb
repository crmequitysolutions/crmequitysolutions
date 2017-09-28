class CreateInvestorPrefs < ActiveRecord::Migration[5.1]
  def change
    create_table :investor_prefs do |t|
      t.integer :investor_pref_id
      t.integer :contact_id
      t.integer :zip_code
      t.integer :community_id
      t.string :property_type
      t.integer :bd_rms
      t.integer :ba_rms
      t.float :max
      t.float :min
      t.boolean :rehab_ind
      t.boolean :main_st_ind

      t.timestamps
    end
  end
end
