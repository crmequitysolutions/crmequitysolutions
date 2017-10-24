class AddTypeToInteractions < ActiveRecord::Migration[5.1]
  def change
    add_column :interactions, :type, :string
  end
end
