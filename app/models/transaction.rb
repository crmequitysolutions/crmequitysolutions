class Transaction < ApplicationRecord
    validates_presence_of :property_id, :purchased_by, :price, :transaction_id
    validates_uniqueness_of :transaction_id
end
