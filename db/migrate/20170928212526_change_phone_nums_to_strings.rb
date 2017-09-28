class ChangePhoneNumsToStrings < ActiveRecord::Migration[5.1]
  def change
    change_column :contacts, :phone, :string
    change_column :contacts, :alt_phone, :string
  end
end
