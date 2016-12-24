Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  resources :reviews
  ActiveAdmin.routes(self)
  resources :feature_values
  resources :features
  root to: 'products#index'
  resources :categories
  resources :products
end
