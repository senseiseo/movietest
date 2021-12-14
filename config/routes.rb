Rails.application.routes.draw do
  resources :categories 
  resources :movies

  root 'movies#index'
end
