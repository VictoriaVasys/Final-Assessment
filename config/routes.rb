Rails.application.routes.draw do
  # root to: "links#index"
  root to: "sessions#new"
  post '/', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  
  get '/sign_up', to: 'users#new'
  
  resources :users, only: [:create]
  resources :links, only: [:index]

  namespace :api do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end
end
