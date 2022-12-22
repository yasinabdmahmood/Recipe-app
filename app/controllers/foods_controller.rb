class FoodsController < ApplicationController
  def index
    @foods = current_user.foods
  end

  def new
    @food = Food.new
  end

  def create
    @food = Recipe.new(food_params)
    @food.user = current_user

    if @food.save
      redirect_to food_index_path
    else
      render :new
    end
  end

  def destroy
    Food.find_by(id: params[:id]).destroy
    redirect_to food_index_path
  end

  private

  def food_params
    params.require(:new_recipe).permit(:name, :meadurement_unit, :price, :quantity)
  end
end
