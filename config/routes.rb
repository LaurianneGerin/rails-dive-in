Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  resources :pools, only: [:index, :show, :new, :create, :edit, :update]
mount Attachinary::Engine => "/attachinary"
  resources :reservations, only: [:index, :new, :create, :show, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
