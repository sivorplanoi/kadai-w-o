Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  
  
  root to: 'toppages#index'
  
  get 'listspage', to: 'lists#index'
  
  resources :personaltabs, only: [:create, :destroy]
  resources :personallists, only: [:create, :destroy]
  resources :personalclassifications, only: [:create, :destroy]

  resources :groups, only: [:create, :destroy]

  resources :relationships, only: [:create, :destroy]

  resources :initialdisplays, only: [:create, :update, :destroy]
  
  resources :grouptabs, only: [:create, :destroy]
  resources :grouplists, only: [:create, :destroy]
  resources :groupclassifications, only: [:create, :destroy]  
  
  resources :id_unique_validates, only: [:create]  

end
