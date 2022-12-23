class RecipeController < ApplicationController
  def index
    @recipes = current_user.recipes
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)

    @recipe.user = current_user

    if @recipe.save
      redirect_to recipe_index_path
    else
      render :new
    end
  end

  def details
    @recipe = Recipe.find(params[:id])
    @recipe_foods = @recipe.recipe_foods.includes(:food)
  end

  def new_ingredient
    @foods = Food.all.map { |food| [food.name, food.id] }
    @recipe_id = params[:id]
    @recipe_food = RecipeFood.new
  end

  def create_ingredient
    @recipe_food = RecipeFood.new(quantity: ingredient_params[:quantity])
    @recipe_food.recipe = Recipe.find(params[:id])
    @recipe_food.food = Food.find(ingredient_params[:food])
    if @recipe_food.save
      redirect_to recipe_details_path(id: params[:id])
    else
      redirect_to recipe_new_ingredient_path(id: params[:id])
    end
  end

  def destroy
    current_recipe = Recipe.find_by(id: params[:id])
    current_recipe.recipe_foods.each do |recipe_food|
      recipe_food.destroy
    end
    current_recipe.destroy
    redirect_to recipe_index_path
  end

  def public_recipes
    @public_recipes = Recipe.where(public: true)
  end

  def generate_shopping_list
    @recipe_foods = RecipeFood.includes(:food, :recipe).select { |item| item.food.user_id == current_user.id }
  end

  private

  def recipe_params
    params.require(:new_recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end

  def ingredient_params
    params.require(:new_recipe_food).permit(:quantity, :food)
  end

  def after_sign_in_path_for(_resource)
    root_path
  end
end
