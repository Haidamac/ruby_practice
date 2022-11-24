Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :articles
      #post '/articles', to: 'articles#create'
      #get '/articles', to: 'articles#index'
      #get '/articles/:id', to: 'articles#show'
      #patch '/articles/:id', to: 'articles#update'
      #delete '/articles/:id', to: 'articles#destroy'
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
