class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.integer :room_id
      t.integer :property_id
      t.string :room_type
      t.float :sqft
      t.integer :windows
      t.integer :closets
      t.text :notes

      t.timestamps
    end
  end
end
