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

  def destroy
    Recipe.find_by(id: params[:id]).destroy
    redirect_to recipe_index_path
  end

  def public_recipes
    @public_recipes = Recipe.where(public: true)
  end

  private

  def recipe_params
    params.require(:new_recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end

  def after_sign_in_path_for(_resource)
    root_path
  end
end
