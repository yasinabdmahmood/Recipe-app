Rails.application.routes.draw do
  devise_for :users
  root "recipe#public_recipes"
  get 'recipe/index'
  get 'recipe/detail/:id', to: "recipe#details", as: "recipe_details"
  get 'recipe/new_ingredient/:id', to: "recipe#new_ingredient", as: "recipe_new_ingredient"
  post 'recipe/create_ingredient/:id', to: "recipe#create_ingredient", as: "recipe_create_ingredient"
  get 'recipe/new'
  get 'recipe/public_recipes'
  post 'recipe/create'
  get 'recipe/destroy/:id', to: 'recipe#destroy', as: 'delete_recipe'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
