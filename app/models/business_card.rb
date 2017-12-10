class BusinessCard < ApplicationRecord
    mount_uploader :image, CardUploader
    validates_presence_of :contact_id, :image
end
