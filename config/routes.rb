Rails.application.routes.draw do
  get 'foods/index'
  get 'foods/new'
  post 'foods/create'
  get 'foods/destroy/:id', to: 'foods#destroy', as: 'delete_food'
  devise_for :users
  root "recipe#public_recipes"
  get 'recipe/index'
  get 'recipe/detail/shopping_list/:id', to: "recipe#generate_shopping_list", as: "shopping_list"
  get 'recipe/detail/:id', to: "recipe#details", as: "recipe_details"
  get 'recipe/new_ingredient/:id', to: "recipe#new_ingredient", as: "recipe_new_ingredient"
  post 'recipe/create_ingredient/:id', to: "recipe#create_ingredient", as: "recipe_create_ingredient"
  get 'recipe/new'
  get 'recipe/public_recipes'
  post 'recipe/create'
  get 'recipe/destroy/:id', to: 'recipe#destroy', as: 'delete_recipe'
  get 'recipe_food/edit_form/:id', to: 'recipe_food#edit_form', as: 'edit_form_recipe_food'
  post 'recipe_food/edit/:id', to: 'recipe_food#edit', as: 'edit_recipe_food'
  get 'recipe_food/destroy/:id', to: 'recipe_food#destroy', as: 'delete_recipe_food'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
