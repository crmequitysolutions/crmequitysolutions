class CreateTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :templates do |t|
      t.string :user_email
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
