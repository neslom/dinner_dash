Rails.application.routes.draw do
  root 'home_page#index'

  resources :items

  resources :categories
end
