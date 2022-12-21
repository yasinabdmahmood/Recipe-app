Rails.application.routes.draw do
  get 'recipe/index'
  get 'recipe/new'
  get 'recipe/public_recipes'
  post 'recipe/create'
  get 'recipe/destroy/:id', to: 'recipe#destroy', as: 'delete_recipe'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
