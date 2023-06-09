Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # get '/map', to: '/cities/search?query=#city'
  # get "/Home", to: "pages#home"
  # get "/:city", to: "pages#show"
#   resources :saved_articles, only: [:create, :index, :destroy]
#   resources :chat_rooms, only: [:create, :show, :destroy]
#   resources :users, only: [:edit]
#   get "cities/:city/articles/topics", to: "articles#topic"

  # get "/Home", to: "pages#home"
  get '/map', to: 'articles#map', as: 'map'
  get "/city/:city", to: "pages#city"
  resources :saved_articles, only: [:create, :index, :destroy]

  get "/:city", to: "pages#city"
  get "article/:article_id/favorite", to: "articles#favorite", as: "article_favorite"
  resources :articles, only: [:show, :new, :create, :index, :destroy]


  resources :users, only: [:edit, :index] do
    resources :chat_rooms, only: [:create, :show, :destroy] do
      resources :messages, only: :create
    end
  end
  get ":city/articles/:topic", to: "articles#topic", as: "city_articles_topic"


  get "/profile/:id", to: "pages#profile", as: 'profile'
  get "cities/search", to: "cities#show", as: 'city'
  get 'users/:id', to: 'users#show', as: 'user'

  get '/map_image', to: 'cities_controller#map_image'

  resources :articles do
    member do
      get 'modal', to: 'articles#modal', as: 'modal'
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # -------route for creating an article-------
  get "/articles/new", to: "articles#new"
  post "/articles", to: "articles#create"
end
