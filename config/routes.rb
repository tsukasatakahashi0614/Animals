Rails.application.routes.draw do

  get 'search/search'
  devise_for :users


  root to: "homes#top"



  resources :users, only: [:show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get "favorites"
    get "followings" => "relationships#followings", as: "followings"
    get "followers" => "relationships#followers", as: "followers"

  end

  resources :posts, only: [:index, :show, :new, :destroy, :create] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end


  resources :messages, only: [:create]
  resources :rooms, only: [:create, :show, ]


  resources :genres, only: [:index, :create, :edit, :update, :destroy]


end