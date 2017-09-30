class Contact < ApplicationRecord
    validates_presence_of :contact_id, :address_id, :first_name, :last_name, :phone, :email, :contact_type
    validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, allow_blank: true
    validates_uniqueness_of :contact_id
    validates :phone, phone: { possible: true, allow_blank: true }
    validates :alt_phone, phone: { possible: true, allow_blank: true }
    validates :fax, phone: { possible: true, allow_blank: true }
end
