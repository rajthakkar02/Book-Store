Rails.application.routes.draw do
  resources :cart_items
  resource :cart, only: %i[ show destroy create ] do
    post "add/:book_id", to: "carts#add", as: "add_to"
    post "/orders", to: "orders#create"
    delete "destroy/:cart_id", to: "cart_items#destroy"
    patch "increase/:cart_item_id", to: "carts#increase", as: "increase"
    patch "decrease/:cart_item_id", to: "carts#decrease", as: "decrease"
  end
  resources :books do
    resources :feedbacks, module: :books
    get "books/:book_id", to: "books#show"
  end
  resources :orders
  resources :authors
  devise_for :users
  ActiveAdmin.routes(self)
  # resources :sellers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  root "home#index"
  get "up" => "rails/health#show", as: :rails_health_check

  # authenticate :user, ->(u) { !u.seller? } do
  #   root 'books#index'
  # end
  # Defines the root path route ("/")
  # root "posts#index"
end
