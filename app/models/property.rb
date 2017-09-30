class Property < ApplicationRecord
    validates_presence_of :address_id, :owner, :property_id
    validates_uniqueness_of :property_id
end
