Rails.application.routes.draw do
  devise_for :users
  root to: 'welcome#index'
  resources :listings
  get "/payments/session", to: "payments#get_stripe_id"
  get "/payments/success", to: "payments#success"
  post "/payments/webhook", to: "payments#webhook"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
