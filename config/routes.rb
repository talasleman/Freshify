Rails.application.routes.draw do
  root 'home#index'
  get 'home/about'
  get 'home/header'
  get 'products/dairy'
  get 'products/fruits'
  get 'products/meat'
  get 'products/vegetables'
end
