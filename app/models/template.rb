# Authored by: Mitchell Berger, Talha Koc, and Noah Over for COMPSCI 408 at Duke University for Tori Patterson

class Template < ApplicationRecord
    validates_presence_of :text, :title
    validates_uniqueness_of :title
end
