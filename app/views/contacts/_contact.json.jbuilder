json.extract! contact, :id, :contact_id, :address_id, :first_name, :middle_name, :last_name, :phone, :phone_ext, :alt_phone, :alt_ext, :fax, :email, :contact_type, :created_at, :updated_at
json.url contact_url(contact, format: :json)
