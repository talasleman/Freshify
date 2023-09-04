Rails.application.routes.draw do
  devise_for :users
   get 'products/meat', to: 'products#meat'
  get 'products/dairy', to: 'products#dairy'
  get 'products/fruits', to: 'products#fruits'
  get 'products/vegetables', to: 'products#vegetables'

  resources :products
  root 'home#index'
  get 'home/about'
  get 'home/header'
end
