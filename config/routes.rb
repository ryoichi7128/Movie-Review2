Rails.application.routes.draw do

  get 'users/show'
  get 'users/edit'
  get '/reviews/new/:id', to: 'reviews#new', as: 'reviews_new'
  post '/reviews/create/:id', to: 'reviews#create'
  resources :reviews, only: [:create, :show, :edit]

  get 'movies/index'
  get 'movies/search'

  get '/movies/show/:id', to: 'movies#show', as: 'movies_show'
  get '/movies/edit/:id', to: 'movies#edit'
  root to: 'movies#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
