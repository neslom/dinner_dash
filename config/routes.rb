Rails.application.routes.draw do
  root 'home_page#index'

  resources :items

  resources :categories

  resources :orders

  get '/cart', to: 'cart#index'

  post '/cart', to: 'cart#create'

  delete '/cart', to: 'cart#destroy'

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'#, as: 'sessions'

  delete '/logout', to: 'sessions#destroy'
end
