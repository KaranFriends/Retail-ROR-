Rails.application.routes.draw do
  get 'addresses/index'
  get 'cards/index'
  get 'setting/index'
  put 'cart/quantity_update'
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

  resources :payment
  
  resources :cards
  resources :addresses

  post 'dashboard/address'

end
