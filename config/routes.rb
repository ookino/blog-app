Rails.application.routes.draw do
  get 'comments/likes'
    root to: 'users#index'
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
