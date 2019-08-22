Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :ducks do
    resources :bookings, only: :create
  end
  resources :bookings, only: [:index, :destroy] do
    resources :reviews, only: [:new, :create]
  end
  resources :reviews, only: [:edit, :update, :destroy]

  # manage ducks
  get 'profiles/:id/', to: "profiles#show", as: 'profile'
  get 'profiles/:id/new', to: "profiles#new", as: 'profile_duck_new'

end

