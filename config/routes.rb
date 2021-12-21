Rails.application.routes.draw do
  resource :session, only: %i[new create destroy]

  resources :users, only: %i[new create edit update]
  
  resources :categories,  only: %i[index show]
  resources :movies

  namespace :admin do 
    resources :users, only: %i[index create edit update destroy]
    resources :movies
    resources :categories, only: %i[index new create edit update destroy]
  end 

  post '/ratings_create', to: 'ratings#ratings_create', as: 'ratings_create'

  root 'movies#index'
end
