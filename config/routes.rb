Rails.application.routes.draw do
  resources :orders do
    member do
      post 'delete_cart_product'
    end
    post 'put_quantity'
  end
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
