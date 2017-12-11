# Authored by: Mitchell Berger, Talha Koc, and Noah Over for COMPSCI 408 at Duke University for Tori Patterson

class PropDoc < ApplicationRecord
    validates_presence_of :prop_doc_id
    validates_uniqueness_of :prop_doc_id
end
