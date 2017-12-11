# Authored by: Mitchell Berger, Talha Koc, and Noah Over for COMPSCI 408 at Duke University for Tori Patterson

class PropertyDisplaysController < ApplicationController
    def index
        @property_displays = PropertyDisplay.all
    end
end
