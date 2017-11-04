class AddUserEmailToContacts < ActiveRecord::Migration[5.1]
  def change
    add_column :contacts, :user_email, :string
  end
end
