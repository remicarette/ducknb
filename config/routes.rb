Rails.application.routes.draw do
  root to: 'pages#home'
  devise_for :users
  resources :ducks do 
    resources :bookings, only: [:index, :new, :create]
    resources :reviews, only: [:index, :new, :create, :edit, :update]
    resources :duck_photos, only: [:new, :create]
  end
  resources :reviews, only: [:show, :destroy] 
  resources :bookings, only: [:show, :destroy] 

  get 'profile/:id', to: "profiles#show", as: 'profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
