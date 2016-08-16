Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  resources :pools, only: [:index, :show, :new, :create, :edit, :update]
mount Attachinary::Engine => "/attachinary"
end
