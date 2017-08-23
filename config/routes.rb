Rails.application.routes.draw do

  devise_for :users
  resources :wikis
  resources :charges, only: [:new, :create]
  resources :downgrades, only: [:create]
  root to: 'home#index'


end
