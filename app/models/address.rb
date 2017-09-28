class Address < ApplicationRecord
    validate :not_valid_state
    validates_presence_of :line_1, :city, :state, :zip_code, :county, :country, :school_district
    validates_format_of :zip_code,
                  with: /\A\d{5}-\d{4}|\A\d{5}\z/,
                  message: "should be 12345 or 12345-1234",
                  allow_blank: true
    
    def not_valid_state
        errors.add(:state, "must be abbreviated (e.g. NC)") if
            !state.blank? and state.length != 2
    end
  
end
