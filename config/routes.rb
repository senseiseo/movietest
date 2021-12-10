Rails.application.routes.draw do
  resources :categories do 
    resources :movies
  end 
  post 
  root 'pages#index'
end
