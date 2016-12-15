Rails.application.routes.draw do
  root to: 'products#index'
  resources :categories
  resources :products
end
