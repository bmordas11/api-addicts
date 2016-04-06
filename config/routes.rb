Rails.application.routes.draw do
  root "apis#index"

  resources :apis, only: [:index, :show, :new, :create]
  resource :api_by_category, only: [:index]
  resource :api_by_rating, only: [:index]
end
