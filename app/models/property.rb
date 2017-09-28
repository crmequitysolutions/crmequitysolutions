class Property < ApplicationRecord
    validates_presence_of :address_id, :owner
end
