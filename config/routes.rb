Rails.application.routes.draw do
  root 'apis#index'
  get 'apis/random' => 'apis#random'
  get 'apis/about' => 'apis#about'
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :apis,
    only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    resources :reviews, only: [:index, :new, :create, :edit, :update, :destroy]
  end
  resources :users, only: [:index, :show, :destroy]

  scope module: 'api' do
    namespace :v1 do
      resources :votes
      get '/upvote/' => 'votes#upvote'
      get '/downvote/' => 'votes#downvote'
      get '/change/:category' => 'api#change'
    end
  end
end
