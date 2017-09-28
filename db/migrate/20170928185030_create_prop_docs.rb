class CreatePropDocs < ActiveRecord::Migration[5.1]
  def change
    create_table :prop_docs do |t|
      t.integer :prop_doc_id
      t.integer :property_id
      t.string :content
      t.string :mime_type
      t.string :file_name
      t.string :file_type
      t.datetime :upload_date

      t.timestamps
    end
  end
end
