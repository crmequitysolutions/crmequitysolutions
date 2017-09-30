class PropDoc < ApplicationRecord
    validates_presence_of :prop_doc_id
    validates_uniqueness_of :prop_doc_id
end
