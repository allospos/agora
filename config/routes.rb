Rails.application.routes.draw do
  root 'dashboard#index'

  post "/users", to: "users#create"

  resources :products, only: [:index, :create, :new, :show] do
    resources :favourites, only: [:create]
  end

  get "/verify/:name/:token", to: "verifications#update", as: :verify
end
