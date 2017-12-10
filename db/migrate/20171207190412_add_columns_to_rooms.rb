class AddColumnsToRooms < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :wall_type, :string
    add_column :rooms, :flooring_type, :string
    add_column :rooms, :outlets, :integer
  end
end
