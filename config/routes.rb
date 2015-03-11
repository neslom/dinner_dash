Rails.application.routes.draw do
  root 'home_page#index'

  resources :items

  resources :categories

  get '/cart', to: 'cart#index'

  post '/cart', to: 'cart#create'

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create', as: 'sessions'
end
