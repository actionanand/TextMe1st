Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'about', to: 'pages#about'
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  
  resources :articles do
    resources :comments, only: [:create]
    member do 
      post 'like'
    end
  end
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'ss7', to: 'codes#index'
  resources :codes, except: [:index]
  resources :categories, except: [:destroy]
end
