class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.integer :property_id
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
