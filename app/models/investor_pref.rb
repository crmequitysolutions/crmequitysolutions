class InvestorPref < ApplicationRecord
    validates_presence_of :contact_id, :investor_pref_id
    validates_format_of :zip_code,
                  with: /\A\d{5}-\d{4}|\A\d{5}\z/,
                  message: "should be 12345 or 12345-1234",
                  allow_blank: true
    validates_uniqueness_of :investor_pref_id
end
