Rails.application.routes.draw do
  devise_for :users
  root 'products#index'
  resources :products
  get "users/logout", to: "users#logout"
  get "users/personal", to: "users#personal"
  resources :users, only: [:index, :show, :edit, :update]

end
