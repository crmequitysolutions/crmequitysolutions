# Authored by: Mitchell Berger, Talha Koc, and Noah Over for COMPSCI 408 at Duke University for Tori Patterson

class Room < ApplicationRecord
    validates_presence_of :room_id, :property_id
end
