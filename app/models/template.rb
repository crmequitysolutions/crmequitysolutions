class Template < ApplicationRecord
    validates_presence_of :text, :title
    validates_uniqueness_of :title
end
