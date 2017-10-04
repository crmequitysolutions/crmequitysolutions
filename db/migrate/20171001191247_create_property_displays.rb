class CreatePropertyDisplays < ActiveRecord::Migration[5.1]
  def change
    create_table :property_displays do |t|
      t.string :Address
      t.string :owner
      t.string :contactInfo
      t.float :value

      t.timestamps
    end
  end
end
