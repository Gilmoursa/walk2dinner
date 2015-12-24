Rails.application.routes.draw do
  #resources
  resources :users
  resources :trips
  resources :weathers
  resources :restaurants
  #welcome
  root to: 'welcome#index'
  #login
  resources :sessions, only: [:create, :destroy]
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  post '/login', to: 'sessions#create'
  #signup
  get '/signup', to: 'users#new', as: "signup"
end
