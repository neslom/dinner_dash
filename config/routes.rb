Rails.application.routes.draw do
  root "home_page#index"

  resources :items

  resources :categories

  resources :orders

  get "/cart", to: "cart#index"

  post "/cart", to: "cart#create"

  delete "/cart", to: "cart#destroy"

  get "/login", to: "sessions#new"

  post "/login", to: "sessions#create"

  delete "/logout", to: "sessions#destroy"

  namespace :admin do
    get "/", to: "dashboard#index"
    get "/orders_dashboard", to: "dashboard#show"

    resources :items

    resources :categories

    resources :orders

    resources :item_categories
  end

end
