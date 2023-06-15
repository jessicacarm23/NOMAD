Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # get "/Home", to: "pages#home"
  # get "/:city", to: "pages#show"
#   resources :saved_articles, only: [:create, :index, :destroy]
#   resources :chat_rooms, only: [:create, :show, :destroy]
#   resources :users, only: [:edit]
#   get "cities/:city/articles/topics", to: "articles#topic"

  # get "/Home", to: "pages#home"
  get "/city/:city", to: "pages#city"
  resources :saved_articles, only: [:create, :index, :destroy]
  resources :chat_rooms, only: [:create, :show, :destroy] do
    resources :messages, only: :create
  end
  get "/:city", to: "pages#city"
  get "article/:article_id/favorite", to: "articles#favorite", as: "article_favorite"
  resources :article, only: [:show, :new, :create, :index, :destroy]


  resources :users, only: [:edit, :index]
  get ":city/articles/:topic", to: "articles#topic", as: "city_articles_topic"


  get "/profile", to: "pages#profile"
  get "cities/search", to: "cities#show"

  get '/map_image', to: 'cities_controller#map_image'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

end
