Rails.application.routes.draw do
  devise_for :users
  root "products#index"

  get  "users/logout"  => "users#logout"
  get  "brands/index"  => "brands#index"

  resources :users, only: [:index, :show, :edit, :update, :new] do
    resources :card, only: [:index, :new, :create, :destroy]
  end

  resources :products do
    resources :page_comments, only: [:create, :destroy]
    get   "buy"        => "products#buy"
    post  "buy"        => "products#pay", as: 'pay'
    get   "completion" => "products#completion"
  end

end
