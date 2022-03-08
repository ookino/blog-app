Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: 'users#index'
  # get 'comments/likes'
  resources :users, only: [:index, :show] do 
    resources :posts, only: [:index, :show, :new, :create] do
       resources :comments, only: [:create]
      resources :likes, only: [:create]
    end
  end

  # get '/users/:id', to: 'users#show'
  # get '/users/:id/posts', to: 'posts#index'
  # get '/users/:id/posts/new', to: 'posts#new', as: 'new_post' 
  # post '/users/:id/posts', to: 'posts#create' as: 'create_post'
  # get '/users/:id/posts/:id', to: 'posts#show'

end
