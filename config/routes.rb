Rails.application.routes.draw do
  get 'recipe/index'
  get 'recipe/new'
  post 'recipe/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
