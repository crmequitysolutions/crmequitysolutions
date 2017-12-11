# Authored by: Mitchell Berger, Talha Koc, and Noah Over for COMPSCI 408 at Duke University for Tori Patterson

class Community < ApplicationRecord
    validates_presence_of :community_name, :zip_code, :community_id
    validates_format_of :zip_code,
                  with: /\A\d{5}-\d{4}|\A\d{5}\z/,
                  message: "should be 12345 or 12345-1234",
                  allow_blank: true
    validates_uniqueness_of :community_id
end
