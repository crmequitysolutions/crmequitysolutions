json.extract! transaction, :id, :transaction_id, :purchased_by, :date, :property_id, :price, :transaction_type, :created_at, :updated_at
json.url transaction_url(transaction, format: :json)
