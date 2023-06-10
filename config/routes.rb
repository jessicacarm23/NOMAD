Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # get "/Home", to: "pages#home"
  # get "/:city", to: "pages#show"

  resources :articles do
    member do
      post 'toggle_favorite', to: "articles#toggle_favorite"
    end
  end

#   resources :saved_articles, only: [:create, :index, :destroy]
#   resources :chat_rooms, only: [:create, :show, :destroy]
#   resources :users, only: [:edit]
#   get "cities/:city/articles/topics", to: "articles#topic"

  get "/Home", to: "pages#home"
  get "/Home?query=:city", to: "pages#city"
  get "/:city", to: "pages#city"
  resources :article, only: [:show, :new, :create, :index, :destroy]
  resources :saved_articles, only: [:create, :index, :destroy]
  resources :chat_rooms, only: [:create, :show, :destroy]

  resources :users, only: [:edit, :index]
  get ":city/articles/:topic", to: "articles#topic", as: "city_articles_topic"


  get "/profile", to: "pages#profile"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

end
