class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.integer :contact_id
      t.integer :address_id
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.integer :phone
      t.integer :phone_ext
      t.integer :alt_phone
      t.integer :alt_ext
      t.integer :fax
      t.string :email
      t.string :contact_type

      t.timestamps
    end
  end
end
