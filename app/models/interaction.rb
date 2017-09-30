class Interaction < ApplicationRecord
    validates_presence_of :date_time, :interaction_type, :result, :interaction_id
    validates_uniqueness_of :interaction_id
end
