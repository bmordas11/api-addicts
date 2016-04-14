Rails.application.routes.draw do
  root 'apis#index'
  get 'apis/random' => 'apis#random'
  resources :apis, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:index, :new, :create]
  end

  resources :users, only: [:index]
  devise_for :users, controllers: { registrations: 'registrations' }
end
