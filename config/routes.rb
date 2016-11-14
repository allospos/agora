Rails.application.routes.draw do
  root 'dashboard#index'

  post "/users", to: "users#create"

  resources :products, only: [:create, :new, :show]

end
