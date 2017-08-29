Rails.application.routes.draw do

  devise_for :users
  resources :wikis
  resources :charges, only: [:new, :create]
  resources :downgrades, only: [:create]
  resources :collaborators, only: [:create, :destroy]
  root to: 'home#index'


end
