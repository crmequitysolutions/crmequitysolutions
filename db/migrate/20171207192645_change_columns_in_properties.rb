class ChangeColumnsInProperties < ActiveRecord::Migration[5.1]
  def change
    change_column :properties, :time_on_mrkt, :float
    change_column :properties, :roof_age, :float
    change_column :properties, :plumb_age, :float
    change_column :properties, :heat_age, :float
    change_column :properties, :cool_age, :float
  end
end
