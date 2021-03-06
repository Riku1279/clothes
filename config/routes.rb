Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    member do
      
      get :likes
    end
  end  
  resources :coordinates, only:[:show,:new,:create,:destroy,:edit,:update]
  
  resources :favorites, only:[:create, :destroy]




end
