class AddUserEmailToImages < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :user_email, :string
  end
end
