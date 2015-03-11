Rails.application.routes.draw do
  root 'home_page#index'

  resources :items

  resources :categories

  get '/cart', to: 'cart#index'

  post '/cart', to: 'cart#create'
end
