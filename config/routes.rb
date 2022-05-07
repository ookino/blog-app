Rails.application.routes.draw do
  get 'comments/likes'
    root to: 'users#index'
  resources :users, only: [:index, :show] do 
    resources :posts, only: [:index, :show, :new, :create] do
       resources :comments, only: [:create]
      resources :likes, only: [:create]
    end
  end
end
