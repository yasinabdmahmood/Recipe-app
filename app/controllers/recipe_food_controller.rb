class RecipeFoodController < ApplicationController
    def edit_form
        @foods = Food.all.map { |food| [food.name, food.id] }
        @recipe_food =RecipeFood.new()
        @recipe_food_id = params[:id]
    end

    def edit
        recipe_food = RecipeFood.find(params[:id])
        recipe_food.quantity = ingredient_params[:quantity]
        recipe_food.food =Food.find(ingredient_params[:food])
        if recipe_food.save
            redirect_to recipe_details_path(id: recipe_food.recipe.id)
        else
            redirect_back(fallback_location: root_path)
        end
    end
    def destroy
      RecipeFood.find_by(id: params[:id]).destroy
      redirect_back(fallback_location: root_path)
    end

    private

    def ingredient_params
        params.require(:new_recipe_food).permit(:quantity, :food)
    end
  end
  