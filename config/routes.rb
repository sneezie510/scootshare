Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/pages/tour', to: 'pages#tour'

  resource :account, only: [:show, :edit, :update]

  resources :trips, only: [:index] do
    member do
      patch :cancel
    end
  end

  resources :scooters, only: [:index, :new, :create, :show] do
    resources :reservations, only: [:new, :create]
  end
  resources :reservations, only: [:index] do
    member do
        patch :approve
        patch :deny
    end
  end
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
