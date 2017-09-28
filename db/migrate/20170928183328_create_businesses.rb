class CreateBusinesses < ActiveRecord::Migration[5.1]
  def change
    create_table :businesses do |t|
      t.integer :business_id
      t.string :business_name
      t.integer :address_id
      t.string :url
      t.string :email
      t.integer :prim_contact_id
      t.integer :sec_contact_id

      t.timestamps
    end
  end
end
