# Authored by: Mitchell Berger, Talha Koc, and Noah Over for COMPSCI 408 at Duke University for Tori Patterson

class Interaction < ApplicationRecord
    validates_presence_of :date_time, :interaction_type, :result, :interaction_id
    validates_uniqueness_of :interaction_id
end
