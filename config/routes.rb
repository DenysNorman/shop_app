Rails.application.routes.draw do
  resources :search_suggestions
  resources :orders do
    member do
      get 'delete_cart_product'
    end
  end
  post 'orders/put_quantity', to: 'orders#put_quantity'

  devise_for :admin_users, ActiveAdmin::Devise.config
  resources :reviews
  ActiveAdmin.routes(self)
  resources :feature_values
  resources :features
  root to: 'products#index'
  resources :categories
  resources :products do
    member do
      post 'add_to_cart'
    end
  end
end
