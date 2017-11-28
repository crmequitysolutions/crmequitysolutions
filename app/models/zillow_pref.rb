class ZillowPref < ApplicationRecord
    validates_presence_of :user_email
    validates_uniqueness_of :user_email
end
