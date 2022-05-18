class GeolocationsController < ApplicationController
  def create
    response = GeolocationFinder.new(geolocation_params[:ip]).ipstack
    @geolocation = Geolocation.new(response)
    @geolocation.save
    render json: @geolocation
  end

  def update

  end

  def show

  end

  def destroy

  end

  private

  def geolocation_params
    params.require(:geolocation).permit(:ip, :url)
  end
end
