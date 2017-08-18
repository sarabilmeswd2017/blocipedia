Rails.application.routes.draw do

  devise_for :users

  resources :wikis

  root 'home#index'


end
