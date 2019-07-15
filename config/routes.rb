Rails.application.routes.draw do
  devise_for :users
  root 'events#index'
  resources :events, only: [:new, :create, :show, :edit, :update, :destroy]
  resources :users, only: [:show, :edit, :update]
  resources :comments, only: [:new, :create, :destroy]
  resources :groups, only: [:show, :create, :destroy]
  resources :like_events, only: [:show, :create, :destroy]
  resources :chats, only: [:index, :new, :create, :destroy] do
    resources :like_chats, only: [:create, :destroy, :show]
  end

  resources :tennis_infos, only: [:index, :new, :create, :destroy] do
    resources :like_infos, only: [:create, :destroy, :show]
  end
  
  resources :diaries, only: [:index, :new, :create, :destroy] do
    resources :like_diaries, only: [:create, :destroy, :show]
  end
  

  get 'search' => 'events#search'
  get '/tennis_info/search' => 'tennis_infos#search'
end
