Rails.application.routes.draw do
  resources :users, only: [:index]
  root 'users#index'
  devise_for :users, controllers: { registrations: 'registrations' }
end
