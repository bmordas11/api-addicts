Rails.application.routes.draw do
  root 'users#index'
  get '/votes/upvote' => 'votes#upvote'
  get '/votes/downvote' => 'votes#downvote'
  resources :apis, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:index, :new, :create]
  end

  resources :users, only: [:index]
  devise_for :users, controllers: { registrations: 'registrations' }

  scope module: 'api' do
    namespace :v1 do
      resources :votes
      get '/upvote/' => 'votes#upvote'
      get '/downvote/' => 'votes#downvote'
    end
  end
end
