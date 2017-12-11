# Authored by: Mitchell Berger, Talha Koc, and Noah Over for COMPSCI 408 at Duke University for Tori Patterson

class Image < ApplicationRecord
    mount_uploader :image, PictureUploader
    validates_presence_of :image, :property_id
end
