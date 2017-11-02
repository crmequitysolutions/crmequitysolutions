class AddUserEmailToTransactions < ActiveRecord::Migration[5.1]
  def change
    add_column :transactions, :user_email, :string
  end
end
