Rails.application.routes.draw do
  resource :session, only: %i[new create destroy]

  resources :users, only: %i[new create edit update]
  
  resources :categories 
  resources :movies

  root 'movies#index'
end
