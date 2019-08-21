Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :ducks do
    resources :bookings, only: [:new, :create]
    resources :reviews, only: [:index, :new, :create, :edit, :update]
    resources :duck_photos, only: [:new, :create]
  end
  resources :reviews, only: [:show, :destroy]
  resources :bookings, only: [:index, :show, :destroy]

  # manage ducks
  get 'profiles/:id/', to: "profiles#show", as: 'profile'
  get 'profiles/:id/new', to: "profiles#new", as: 'profile_duck_new'

  # GET 'profiles/:id/ducks/:id/edit', to: "profiles#edit", as: 'profile_duck_edit'
  # DELETE 'profile/:id', to: "profiles#destroy", as: 'profile_destroy_duck'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
