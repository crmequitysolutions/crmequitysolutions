json.extract! room, :id, :room_id, :property_id, :room_type, :sqft, :windows, :closets, :notes, :created_at, :updated_at
json.url room_url(room, format: :json)
