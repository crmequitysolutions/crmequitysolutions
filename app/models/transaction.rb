# Authored by: Mitchell Berger, Talha Koc, and Noah Over for COMPSCI 408 at Duke University for Tori Patterson

class Transaction < ApplicationRecord
    validates_presence_of :property_id, :purchased_by, :price, :transaction_id
    validates_uniqueness_of :transaction_id
end
