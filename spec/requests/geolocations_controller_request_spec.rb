require 'rails_helper'

RSpec.describe GeolocationsController, type: :request do
  let(:url) { 'http://localhost:3000/geolocations' }
  let(:geolocation) { create(:geolocation) }

  describe 'POST /geolocations' do
    let(:params) do
      {
        geolocation: {
          ip: '172.217.174.228'
        }
      }
    end

    context 'Create geolocation' do
      it 'should create geolocation with location and language' do
        expect do
          post url, params: params
        end.to change(Geolocation, :count).by 1
      end
    end
  end

  describe 'GET /geolocations' do
    let(:params) do
      {
        geolocation: {
          ip: geolocation.ip
        }
      }
    end

    context 'Return geolocation data' do
      it 'should return status ok' do
        get url, params: params
        expect(response.status).to be 200
      end

      it 'should return error when ip is not valid' do
        params[:geolocation][:ip] = '1234'
        get url, params: params
        expect(response.status).to be 404
      end
    end
  end

  describe 'DELETE /geolocations' do
    let(:params) do
      {
        geolocation: {
          ip: geolocation.ip
        }
      }
    end

    context 'Delete geolocation' do
      it 'should return status ok' do
        delete url, params: params
        expect(response.status).to be 200
      end
      it 'should return error when invalid ip address' do
        params[:geolocation][:ip] = '1234'
        delete url, params: params
        expect(response.status).to be 422
      end
    end
  end
end
