# Authored by: Mitchell Berger, Talha Koc, and Noah Over for COMPSCI 408 at Duke University for Tori Patterson

class ZillowPref < ApplicationRecord
    validates_presence_of :user_email
    validates_uniqueness_of :user_email
end
