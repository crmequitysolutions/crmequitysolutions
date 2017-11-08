class Property < ApplicationRecord
    validates_presence_of :address_id, :owner, :property_id, :user_email
    validates_uniqueness_of :property_id
    reverse_geocoded_by :latitude, :longitude
    after_validation :reverse_geocode
end
