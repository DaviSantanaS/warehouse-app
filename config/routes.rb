Rails.application.routes.draw do

  get "/", to: "home#index"

  resources :warehouses,  only: [:show]

  # Defines the root path route ("/")
  # root "posts#index"
end
