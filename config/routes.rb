Rails.application.routes.draw do
  resources :flies, only: :index
  resources :bookings, only: [:new,:create]
  root "flies#index"
end
