class CreateBusinessCards < ActiveRecord::Migration[5.1]
  def change
    create_table :business_cards do |t|
      t.integer :contact_id
      t.string :image

      t.timestamps
    end
  end
end
