Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :ducks do
    resources :bookings, only: [:index, :new, :create]
    resources :duck_photos, only: [:new, :create]
  end
  resources :reviews, only: [ :destroy]
  resources :bookings, only: [:show, :destroy] do
    resources :reviews, only: [ :new, :create ]
  end

  resources :reviews, only: [ :edit, :update, :destroy ]

  # manage ducks
  get 'profiles/:id/', to: "profiles#show"
  get 'profiles/:id/new', to: "profiles#new", as: 'profile_duck_new'

  # GET 'profiles/:id/ducks/:id/edit', to: "profiles#edit", as: 'profile_duck_edit'
  # DELETE 'profile/:id', to: "profiles#destroy", as: 'profile_destroy_duck'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
