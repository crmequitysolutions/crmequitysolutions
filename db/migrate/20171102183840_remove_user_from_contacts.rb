class RemoveUserFromContacts < ActiveRecord::Migration[5.1]
  def change
    remove_column :contacts, :user_id, :integer
  end
end
