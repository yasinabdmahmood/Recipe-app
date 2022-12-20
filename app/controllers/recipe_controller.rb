class RecipeController < ApplicationController
  def index
  end

  def new
    @recipe = Recipe.new()
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
  
  private

  def recipe_params
    params.require(:new_recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
