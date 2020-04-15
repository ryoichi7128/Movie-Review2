Rails.application.routes.draw do
  get 'movies/index'
  get 'movies/show'
  root to: 'movies#index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
