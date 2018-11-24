Rails.application.routes.draw do
  devise_for :users
  get "users/logout", to: "users#logout"
  resources :users, only: [:index, :show, :edit, :update, :new]

  resources :products
  root "products#index"
  get "products/buy", to: "products#buy"

  get  "brands/index"  =>  "brands#index"
end
