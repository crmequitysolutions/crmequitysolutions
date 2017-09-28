class Transaction < ApplicationRecord
    validates_presence_of :property_id, :purchased_by, :price
end
