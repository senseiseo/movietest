Rails.application.routes.draw do
  resources :movies
  get '/movies', to: 'movies#index'
  root 'movies#index'
end
