Rails.application.routes.draw do

  devise_for :admins, path: 'admin', controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords'
  }

  devise_for :users


  root to: "homes#top"

  resources :users, only: [:show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get "followings" => "relationships#followings", as: "followings"
    get "followers" => "relationships#followers", as: "followers"
   collection do
  	 get "quit"
  	 patch "out"
  	end
  end

  resources :posts, only: [:index, :show, :new, :destroy, :create] do
    resource :favorites, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
  end

end
