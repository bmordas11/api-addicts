Rails.application.routes.draw do
  root 'apis#index'
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :apis, only: [:index, :show, :new, :create] do
    resources :reviews, only: [:index, :new, :create]
  end

  resources :users, only: [:index, :show]

  scope module: 'api' do
    namespace :v1 do
      resources :votes
      get '/upvote/' => 'votes#upvote'
      get '/downvote/' => 'votes#downvote'
    end
  end
end
