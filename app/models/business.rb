# Authored by: Mitchell Berger, Talha Koc, and Noah Over for COMPSCI 408 at Duke University for Tori Patterson

class Business < ApplicationRecord
    require 'uri'
    
    validates_presence_of :business_name, :prim_contact_id, :email, :address_id, :business_id
    validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, allow_blank: true
    validates_uniqueness_of :business_id
    validate :invalid_url
    
    def invalid_url
        errors.add(:url, "is invalid") if 
            !url.blank? and !(url =~ /\A#{URI::regexp}\z/)
    end
end
