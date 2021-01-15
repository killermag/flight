Rails.application.routes.draw do
  resources :flies, only: :index
  root "flies#index"
end
