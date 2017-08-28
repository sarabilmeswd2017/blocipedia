Rails.application.routes.draw do
  devise_for :users
  resources :wikis
  resources :charges, only: [:new, :create]
  resources :downgrades, only: [:create]
  resources :collaborators, only: [:new, :create, :destroy]
  root to: 'home#index'
end
