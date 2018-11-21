Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  get "products/buy", to: "products#buy"
  resources :products
  get "users/logout", to: "users#logout"
  resources :users, only: [:index, :show, :edit, :update, :new]


end
