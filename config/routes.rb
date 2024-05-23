Rails.application.routes.draw do
  resources :orders
  resources :feedbacks
  resources :books
  resources :authors
  devise_for :users
  ActiveAdmin.routes(self)
  resources :sellers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  root "home#index"
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
