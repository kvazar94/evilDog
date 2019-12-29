Rails.application.routes.draw do

  devise_for :users
  resources :advertisements, only: [:show, :index]
  resources :users
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'advertisements#index'
  
  resources :pictures, only: [:create, :destroy]
  resources :categories, only: [:show]

  namespace :admin do
  	resources :categories
  	resources :advertisements, except: [:new, :create, :edit] 
    resources :users do
      get :new
      
      post :edit
    end
  end

  namespace :users do
    get :show_archived
    get :show_approved
    get :show_published
    get :show_rejected
    resources :advertisements, except: [:show, :index]
  end

end
