class LocationsController < ApplicationController
  def index
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if !@location.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.update("new_location_modal", template: "locations/new"), status: :unprocessable_entity
        end
      end
    else
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace("new_location_modal", partial: "frames/new_modal_location_frame"), status: :created
        end
      end
    end
  end

  private 

  def location_params
    params.require(:location).permit(:country, :city, :area, :street, :building_number, :full_address)
  end 

end
