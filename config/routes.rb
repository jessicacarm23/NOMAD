Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
<<<<<<< HEAD
=======
  # get "/Home", to: "pages#home"
  # get "/:city", to: "pages#show"
>>>>>>> master
  resources :article, only: [:show, :new, :create, :index, :destroy]
  resources :saved_articles, only: [:create, :index, :destroy]
  resources :chat_rooms, only: [:create, :show, :destroy]
  resources :users, only: [:edit]
  get "cities/:city/articles/topics", to: "articles#topic"
  get "/profile", to: "pages#profile"
  get "cities/:city", to: "pages#show"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
