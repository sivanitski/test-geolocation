Rails.application.routes.draw do
  post '/geolocations', to: 'geolocations#create'
  get 'geolocations', to: 'geolocations#show'
  delete 'geolocations', to: 'geolocations#destroy'
end
