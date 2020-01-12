# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :advertisements, only: %i[show index]
  resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'advertisements#index'

  resources :pictures, only: %i[create destroy]
  resources :categories, only: [:show]

  namespace :admin do
    resources :categories
    resources :advertisements, except: %i[new create edit]
    resources :users
  end

  namespace :users do
    resources :advertisements
    resources :categories, only: [:show]
  end
end
