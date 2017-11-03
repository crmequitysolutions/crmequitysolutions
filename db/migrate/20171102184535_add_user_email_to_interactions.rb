class AddUserEmailToInteractions < ActiveRecord::Migration[5.1]
  def change
    add_column :interactions, :user_email, :string
  end
end
