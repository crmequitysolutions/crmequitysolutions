class ChangeFaxToStringInContacts < ActiveRecord::Migration[5.1]
  def change
    change_column :contacts, :fax, :string
  end
end
