class BusinessCard < ApplicationRecord
    mount_uploader :image, CardUploader
end
