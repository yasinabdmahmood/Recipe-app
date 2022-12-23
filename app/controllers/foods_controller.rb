class FoodsController < ApplicationController
  def index
    @foods = current_user.foods
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user = current_user

    if @food.save
      redirect_to foods_index_path
    else
      render :new
    end
  end

  def destroy
    current_food = Food.find_by(id: params[:id])
    current_food.recipe_foods.each(&:destroy)
    current_food.destroy
    redirect_to foods_index_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :meadurement_unit, :price, :quantity)
  end
end
