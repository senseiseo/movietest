Rails.application.routes.draw do
  resources :users, only: %i[new create]
  resources :categories 
  resources :movies

  root 'movies#index'
end
