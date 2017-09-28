json.extract! business, :id, :business_id, :business_name, :address_id, :url, :email, :prim_contact_id, :sec_contact_id, :created_at, :updated_at
json.url business_url(business, format: :json)
