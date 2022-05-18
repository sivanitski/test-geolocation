Rails.application.routes.draw do
  resources :geolocations, only: [:create, :update, :show, :destroy]
end
