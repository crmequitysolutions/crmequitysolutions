class CreateCommunities < ActiveRecord::Migration[5.1]
  def change
    create_table :communities do |t|
      t.integer :community_id
      t.string :community_name
      t.integer :zip_code

      t.timestamps
    end
  end
end
