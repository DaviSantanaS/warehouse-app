Rails.application.routes.draw do
  get 'orders/new'
  get 'orders/create'

  devise_for :users

  root to: "home#index"

  resources :warehouses,  only: [:show, :new, :create, :edit, :update, :destroy]
  resources :suppliers, only: [:index, :show, :new, :create, :edit, :update]
  resources :product_models, only: [:index, :new, :create, :show]
  resources :orders, only: [:new, :create]

end
