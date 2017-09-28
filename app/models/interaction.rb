class Interaction < ApplicationRecord
    validates_presence_of :date_time, :type, :result
end
