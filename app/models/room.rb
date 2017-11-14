class Room < ApplicationRecord
    validates_presence_of :room_id, :property_id
end
