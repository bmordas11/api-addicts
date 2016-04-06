Rails.application.routes.draw do
  root 'users#index'
  resources :apis, only: [:index, :show, :new, :create]
  resources :users, only: [:index]
  devise_for :users, controllers: { registrations: 'registrations' }
end
