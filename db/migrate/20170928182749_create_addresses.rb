class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.integer :address_id
      t.string :line_1
      t.string :line_2
      t.string :city
      t.string :state
      t.integer :zip_code
      t.string :county
      t.string :country
      t.integer :community_id
      t.string :school_district

      t.timestamps
    end
  end
end
