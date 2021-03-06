Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'

  root to: 'top_pages#home'
  get     'signup', to: 'users#new'
  get     'login' , to: 'sessions#new'
  post    'login' , to: 'sessions#create'
  delete  'logout', to: 'sessions#destroy'
  get     'about',  to: 'abouts#show'
  
  resources :users
  resources :sessions, only:[:new, :create, :destroy]
  resources :topics
  resources :metaphors
  resources :comments
  resources :relationships, only: [:create, :destroy]
  
  resources :users do
    member do
      get :followings, :followers
    end
  end
  
  resources :metaphors do
    resources :likes, only: [:create, :destroy]
  end

end
