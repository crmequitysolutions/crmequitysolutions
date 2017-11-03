class AddUserEmailToBusinesses < ActiveRecord::Migration[5.1]
  def change
    add_column :businesses, :user_email, :string
  end
end
