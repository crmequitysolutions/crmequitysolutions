class Template < ApplicationRecord
    validates_presence_of :text, :title
end
