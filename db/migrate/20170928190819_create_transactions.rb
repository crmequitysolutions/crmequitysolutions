class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.integer :transaction_id
      t.integer :purchased_by
      t.datetime :date
      t.integer :property_id
      t.float :price
      t.string :transaction_type

      t.timestamps
    end
  end
end
