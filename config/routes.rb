Rails.application.routes.draw do
  get 'categories/index'
  devise_for :users
  root to: 'welcome#index'
  resources :listings
  resources :categories
  resources :carts, only: [:create, :index]
  # resources :orders
  # get 'carts/:id', to: "carts#show", as: "cart"
  # delete 'carts/:id', to: "carts#destroy"

  # post 'cart_listings/:id/add', to: "cart_listings#add_quantity", as: "cart_listing_add"
  # post 'cart_listings/:id/reduce', to: "cart_listings#reduce_quantity", as: "cart_listing_reduce"
  # post 'cart_listings', to: "cart_listings#create"
  # get 'cart_listings/:id', to: "cart_listings#show", as: "cart_listing"
  # delete 'cart_listings/:id', to: "cart_listings#destroy"



  get "/payments/session", to: "payments#get_stripe_id"
  get "/payments/success", to: "payments#success"
  post "/payments/webhook", to: "payments#webhook"
end
