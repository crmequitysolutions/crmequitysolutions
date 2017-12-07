class ChangeColumnsInProperties < ActiveRecord::Migration[5.1]
  def change
    change_column :properties, :time_on_mrkt, 'float USING CAST(time_on_mrkt AS float)'
    change_column :properties, :roof_age, 'float USING CAST(roof_age AS float)'
    change_column :properties, :plumb_age, 'float USING CAST(plumb_age AS float)'
    change_column :properties, :heat_age, 'float USING CAST(heat_age AS float)'
    change_column :properties, :cool_age, 'float USING CAST(cool_age AS float)'
  end
end
