class AddUserEmailToRentalUnits < ActiveRecord::Migration[5.1]
  def change
    add_column :rental_units, :user_email, :string
  end
end
