class ChangeZipCodeToString < ActiveRecord::Migration[5.1]
  def change
    change_column(:addresses, :zip_code, :string)
    change_column(:communities, :zip_code, :string)
    change_column(:investor_prefs, :zip_code, :string)
  end
end
