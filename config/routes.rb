# == Route Map
#
#          Prefix Verb   URI Pattern                     Controller#Action
#           users GET    /users(.:format)                users#index
#                 POST   /users(.:format)                users#create
#        new_user GET    /users/new(.:format)            users#new
#       edit_user GET    /users/:id/edit(.:format)       users#edit
#            user GET    /users/:id(.:format)            users#show
#                 PATCH  /users/:id(.:format)            users#update
#                 PUT    /users/:id(.:format)            users#update
#                 DELETE /users/:id(.:format)            users#destroy
#           trips GET    /trips(.:format)                trips#index
#                 POST   /trips(.:format)                trips#create
#        new_trip GET    /trips/new(.:format)            trips#new
#       edit_trip GET    /trips/:id/edit(.:format)       trips#edit
#            trip GET    /trips/:id(.:format)            trips#show
#                 PATCH  /trips/:id(.:format)            trips#update
#                 PUT    /trips/:id(.:format)            trips#update
#                 DELETE /trips/:id(.:format)            trips#destroy
#        weathers GET    /weathers(.:format)             weathers#index
#                 POST   /weathers(.:format)             weathers#create
#     new_weather GET    /weathers/new(.:format)         weathers#new
#    edit_weather GET    /weathers/:id/edit(.:format)    weathers#edit
#         weather GET    /weathers/:id(.:format)         weathers#show
#                 PATCH  /weathers/:id(.:format)         weathers#update
#                 PUT    /weathers/:id(.:format)         weathers#update
#                 DELETE /weathers/:id(.:format)         weathers#destroy
#     restaurants GET    /restaurants(.:format)          restaurants#index
#                 POST   /restaurants(.:format)          restaurants#create
#  new_restaurant GET    /restaurants/new(.:format)      restaurants#new
# edit_restaurant GET    /restaurants/:id/edit(.:format) restaurants#edit
#      restaurant GET    /restaurants/:id(.:format)      restaurants#show
#                 PATCH  /restaurants/:id(.:format)      restaurants#update
#                 PUT    /restaurants/:id(.:format)      restaurants#update
#                 DELETE /restaurants/:id(.:format)      restaurants#destroy
#            root GET    /                               welcome#index
#        sessions POST   /sessions(.:format)             sessions#create
#         session DELETE /sessions/:id(.:format)         sessions#destroy
#           login GET    /login(.:format)                sessions#new
#          logout GET    /logout(.:format)               sessions#destroy
#                 POST   /login(.:format)                sessions#create
#          signup GET    /signup(.:format)               users#new
#

Rails.application.routes.draw do
  #resources
  resources :users
  resources :trips, only: [:show]
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
