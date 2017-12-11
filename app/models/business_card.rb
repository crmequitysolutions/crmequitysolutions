# Authored by: Mitchell Berger, Talha Koc, and Noah Over for COMPSCI 408 at Duke University for Tori Patterson

class BusinessCard < ApplicationRecord
    mount_uploader :image, CardUploader
    validates_presence_of :contact_id, :image
end
