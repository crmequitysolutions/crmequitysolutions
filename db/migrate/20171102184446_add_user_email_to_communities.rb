class AddUserEmailToCommunities < ActiveRecord::Migration[5.1]
  def change
    add_column :communities, :user_email, :string
  end
end
