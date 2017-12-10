class Image < ApplicationRecord
    mount_uploader :image, PictureUploader
    validates_presence_of :image, :property_id
end
