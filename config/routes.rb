Rails.application.routes.draw do
  get '/movies', to: 'movies#index'
  root 'movies#index'
end
