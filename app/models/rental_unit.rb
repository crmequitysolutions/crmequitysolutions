class RentalUnit < ApplicationRecord
    validates_presence_of :property_id, :rental_unit_id
    validates_uniqueness_of :rental_unit_id
end
