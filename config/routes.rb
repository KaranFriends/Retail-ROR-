
Rails.application.routes.draw do
  get 'order/index'
  get 'setting/index'
  post 'cart/quantity_update'
  #get 'users/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'registration#index'

  resources :registration
  resources :session
  resources :dashboard
  resources :product
  resources :setting
  resources :manage_products
  resources :cart
  resources :order
end
