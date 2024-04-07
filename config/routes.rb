Rails.application.routes.draw do

  root to: "home#index"

  resources :warehouses,  only: [:show]

  # Defines the root path route ("/")
  # root "posts#index"
end
