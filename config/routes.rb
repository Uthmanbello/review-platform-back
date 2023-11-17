Rails.application.routes.draw do
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "facebook_reviews#index"

  resources :facebook_reviews

  namespace :api do
    namespace :v1 do
      get 'facebook_reviews/index'
      get 'facebook_reviews/show'

      resources :facebook_reviews, only: [:index, :show]
    end
  end
  
end
