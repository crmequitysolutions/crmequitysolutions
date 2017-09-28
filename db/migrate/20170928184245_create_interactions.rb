class CreateInteractions < ActiveRecord::Migration[5.1]
  def change
    create_table :interactions do |t|
      t.integer :interaction_id
      t.integer :contact_id
      t.datetime :date_time
      t.string :type
      t.string :result
      t.text :note
      t.integer :property_id

      t.timestamps
    end
  end
end
