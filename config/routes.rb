Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users,
    controllers:{omniauth_callbacks: "users/omniauth_callbacks"}
  root "static_pages#home"
  concern :paginatable do
        get "(page/:page)", action: :index, on: :collection, as: ""
  end
  # get "/auth/:provider/callback", :to => "sessions#create"
  # get "/auth/failure", :to => "sessions#failure"
  get "/search", :to => "posts#search"
  get "users/:id/profile", :to =>"users#show_profile", as: "profile"
  get "users/:id/following", :to =>"users#show_following", as: "following"
  get "users/:id/followers", :to =>"users#show_followers", as: "followers"
  notify_to :users
  resources :users do
    member do
      get "followers/new", to: "followers#new"
      get "following/new", to: "following#new"
    end
  end
  # resources :books, only: %i(index show) do
  #   resources :rates, only: [:create]
  # end
  # resources :genres, only: :show
  resources :posts do
    resources :comments
    resources :likes, only: %i(create destroy)
  end
  resources :relationships, only: %i(create destroy)
  resources :messages, only: :index
  resources :conversations, only: [:create] do
    member do
      post :close
    end

    resources :messages, only: :create
  end

  mount ActionCable.server, at: '/cable'
end
