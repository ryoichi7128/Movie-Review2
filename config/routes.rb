Rails.application.routes.draw do

  get 'homes/about'

  devise_for :users
  resources :users, only: [:show, :edit, :update]


  get '/reviews/new/:id', to: 'reviews#new', as: 'reviews_new'
  resources :reviews, only: [:create, :show, :edit, :update, :destroy]

  get 'movies/index'
  get '/movies/show/:id', to: 'movies#show', as: 'movies_show'
  root to: 'movies#index'
  resources :movies, only: [:index, :show] do
  resource :favorites, only: [:create, :destroy]
  end

  get 'search', to: 'movies#search', as: 'movie_search'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
