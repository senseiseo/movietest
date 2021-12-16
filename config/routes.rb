Rails.application.routes.draw do
  resource :session, only: %i[new create destroy]

  resources :users, only: %i[new create edit update]
  
  resources :categories 
  resources :movies

  namespace :admin do 
    resources :users, only: %i[index]
  end 

  root 'movies#index'
end
