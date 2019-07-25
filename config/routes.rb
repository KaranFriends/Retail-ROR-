
Rails.application.routes.draw do
  get 'setting/index'
  #get 'users/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'registrations#index'
  resources :registrations
  resources :sessions
  resources :dashboards
  resources :products
  resources :setting
end
