Rails.application.routes.draw do
  get 'addresses/index'
  get 'cards/index'
  get 'setting/index'
  put 'cart/quantity_update'
  #get 'users/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'registration#index'

  resource :registration
  resource :session
  resource :dashboard
  resources :product
  resource :setting
  resources :manage_products
  resource :cart
  resource :order
  resource :payment
  resources :cards
  resources :addresses

  post 'dashboard/address'

end
