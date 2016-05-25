Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/new'

  get 'users/new'

  root to: 'top_pages#home'
  get     'signup', to: 'users#new'
  get     'login' , to: 'sessions#new'
  post    'login' , to: 'sessions#create'
  delete  'logout', to: 'sessions#destroy'
  
  resources :users
  resources :sessions, only:[:new, :create, :destroy]
  resources :topics

end
