class PropertyDisplaysController < ApplicationController
    def index
        @property_displays = PropertyDisplay.all
    end
end
