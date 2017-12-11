# Authored by: Mitchell Berger, Talha Koc, and Noah Over for COMPSCI 408 at Duke University for Tori Patterson

class RentalUnit < ApplicationRecord
    validates_presence_of :property_id, :rental_unit_id
    validates_uniqueness_of :rental_unit_id
end
