Rails.application.routes.draw do
  # root to: "links#index"
  root to: "home#show"
  
  get '/sign_up', to: 'sign_up#show'

  resources :links, only: [:index]

  namespace :api do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end
end
