class AddUserEmailToAddresses < ActiveRecord::Migration[5.1]
  def change
    add_column :addresses, :user_email, :string
  end
end
