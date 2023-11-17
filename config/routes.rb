Rails.application.routes.draw do
  resources :facebook_reviews
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "categories#index"

  resources :categories do
    resources :sub_categories do
      resources :products
    end
  end

  # For example, if you have custom actions like 'search' for items
  get '/products/search', to: 'products#search', as: 'search_products'

  namespace :api do
    namespace :v1 do
      get 'products/index'
      get 'products/show'
      get 'sub_categories/index'
      get 'sub_categories/show'
      get 'categories/index'
      get 'categories/show'
      get 'facebook_reviews/index'
      get 'facebook_reviews/show'

      resources :facebook_reviews, only: [:index, :show]
      resources :categories, only: [:index, :show] do
        resources :sub_categories, only: [:index, :show] do
          resources :products, only: [:index, :show]
        end
      end
    end
  end
  
end
