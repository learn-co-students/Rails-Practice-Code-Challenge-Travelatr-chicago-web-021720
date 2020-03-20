class DestinationsController < ApplicationController

    def index
        @destinations = Destination.order(:country, :name)
    end
    
    def show
        @destination = Destination.find(params[:id])
    end
    
end