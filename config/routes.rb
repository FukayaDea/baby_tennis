Rails.application.routes.draw do
  devise_for :users
  root 'events#index'
  resources :events, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :users, only: [:show, :edit, :update]
  resources :comments, only: [:new, :create, :destroy]
  resources :groups, only: [:show, :create, :destroy]
  resources :like_events, only: [:show, :create, :destroy]

  get 'search' => 'events#search'
end
