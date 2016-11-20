Rails.application.routes.draw do
  root 'dashboard#index'

  post "/users", to: "users#create"

  resources :products, only: [:index, :create, :new, :show] do
    resources :favourites, only: [:create]
  end

  get :profile, to: "users#profile"
  post :update_phone, to: "users#update_phone"

  get "/verify/:name/:token", to: "verifications#update", as: :verify
  post "/verify", to: "verifications#create", as: :verify_token

  resources :verifications, only: [:new]
end
