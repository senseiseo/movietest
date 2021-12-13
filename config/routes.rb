Rails.application.routes.draw do
  resources :categories 
  resources :movies

  root 'pages#index'
end
