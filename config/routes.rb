Rails.application.routes.draw do
  resources :reviews
  ActiveAdmin.routes(self)
  resources :feature_values
  resources :features
  root to: 'products#index'
  resources :categories
  resources :products
end
