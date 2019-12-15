Rails.application.routes.draw do
  
 devise_for :users 
 resources :advertisements
 resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'advertisements#index'
  resources :pictures, only: [:create, :destroy]
  resources :categories, only: [:show]


end
