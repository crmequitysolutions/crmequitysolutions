class AddUserEmailToPropDocs < ActiveRecord::Migration[5.1]
  def change
    add_column :prop_docs, :user_email, :string
  end
end
