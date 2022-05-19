class GeolocationsController < ApplicationController
  before_action :find_ip

  def create
    @geolocation = Geolocation.find_by(ip: @ip_address)
    if !@geolocation.present?
      begin
        geolocation_data = GeolocationFinder.new(@ip_address).ipstack
        if geolocation_data
          @geolocation = Geolocation.new(geolocation_data)
          if @geolocation.save
            render json: serialized('geolocation', @geolocation, { include: [:location] }), status: :created
          else
            render json: { error: 'Geolocatio could not be saved!!' }, status: :unprocessable_entity
          end
        else
          render json: { error: 'Something went wrong!!' }, status: :unprocessable_entity
        end
      rescue StandardError => e
        render json: { error: e }, status: :unprocessable_entity
      end
    else
      render json: serialized('geolocation', @geolocation, { include: [:location] }), status: :found
    end
  end

  def show
    @geolocation = Geolocation.find_by(ip: @ip_address)
    if @geolocation.present?
      render json: serialized('geolocation', @geolocation, { include: [:location] }), status: :ok
    else
      render json: { error: 'Could not find geolocation with the IP' }, status: :not_found
    end
  end

  def destroy
    @geolocation = Geolocation.find_by(ip: @ip_address)
    if @geolocation&.destroy
      render json: { message: 'Geolocation destroyed successfully' }, status: :ok
    else
      render json: { error: 'Geolocation could not be destroyed!!' }, status: :unprocessable_entity
    end
  end

  private

  def geolocation_params
    params.require(:geolocation).permit(:ip, :url)
  end

  def find_ip
    @ip_address = geolocation_params[:url].present? ? IPSocket.getaddress(geolocation_params[:url]) : geolocation_params[:ip]
  end
end
