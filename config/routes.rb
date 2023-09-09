Rails.application.routes.draw do

  resource :cart, only: [:show, :edit, :update, :destroy] do
    post 'add_item/:product_id', to: 'carts#add_item', as: :add_item
    delete 'remove_item/:product_id', to: 'carts#remove_item', as: :remove_item
  end

  devise_for :users, controllers: { registrations: 'users/registrations' }
  get 'products/meat', to: 'products#meat'
  get 'products/dairy', to: 'products#dairy'
  get 'products/fruits', to: 'products#fruits'
  get 'products/vegetables', to: 'products#vegetables'

  resources :products
  root 'home#index'
  get 'home/about'
  get 'home/header'
end
