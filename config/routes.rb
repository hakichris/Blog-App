Rails.application.routes.draw do
  devise_for :users

  # root 'users#index'
  # resources :users, only: %i[index show] do
  #   resources :posts, only: %i[index show new create] do
  #     resources :comments, only: %i[ new create ]
  #     resources :likes, only: [:create]

  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:new, :create, :destroy]
      resources :likes, only: [:create]
    end 
  end
end
