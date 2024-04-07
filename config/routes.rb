Rails.application.routes.draw do

  get "/", to: "home#index"

  # Defines the root path route ("/")
  # root "posts#index"
end
