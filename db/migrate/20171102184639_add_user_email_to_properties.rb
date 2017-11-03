class AddUserEmailToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :user_email, :string
  end
end
