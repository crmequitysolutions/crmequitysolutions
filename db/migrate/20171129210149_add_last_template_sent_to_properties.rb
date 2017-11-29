class AddLastTemplateSentToProperties < ActiveRecord::Migration[5.1]
  def change
    add_column :properties, :last_template_sent, :string
  end
end
