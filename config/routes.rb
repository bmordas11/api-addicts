Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :apis

    root to: "users#index"
  end

  root 'users#index'
  resources :apis, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:index, :new, :create]
  end

  resources :users, only: [:index]
  devise_for :users, controllers: { registrations: 'registrations' }
end
