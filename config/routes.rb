Rails.application.routes.draw do
  get 'addresses/index'
  get 'cards/index'
  get 'setting/index'
  put 'cart/quantity_update'
  #get 'users/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'registrations#index'

  resource :registration
  resource :session
  resource :dashboard
  resources :products
  resource :setting
  resources :manage_products
  resources :cart
  resource :order
  resource :payment
  resources :cards
  resources :addresses

  get 'dashboards/profile'
  get 'dashboards/addresses'
  get 'dashboards/new_address'
  get 'dashboards/edit_address'
  get 'dashboards/cards'
  get 'dashboards/order_placed'
  get 'dashboards/order_recieved'

end
