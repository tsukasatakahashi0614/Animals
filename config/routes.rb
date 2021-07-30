Rails.application.routes.draw do
  get 'search/search'
  devise_for :users

  root to: 'homes#top'

  resources :users, only: %i[show edit update] do
    resources :notifications, only: :index
    resource :relationships, only: %i[create destroy]
    get 'favorites'
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    
  end

  resources :posts, only: [:index, :show, :new, :destroy, :create] do
    resource :favorites, only: %i[create destroy]
    resources :post_comments, only: %i[create destroy]
  end
  
  get 'following_posts' => "posts#following_posts"

  resources :messages, only: [:create]
  resources :rooms, only: %i[create show]

  resources :genres, only: %i[index create edit update destroy]
end
