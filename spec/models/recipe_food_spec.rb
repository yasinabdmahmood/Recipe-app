require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before :all do
    @user = User.new(name: 'benkis')
    @food = Food.new(user: @user, name: 'food_name', meadurement_unit: 'kg',price: 5, quantity: 10)
    @recipe = Recipe.new(user: @user, name: 'test name', preparation_time: 1,
      cooking_time: 1, description: 'test description', public: true)
    @recipe_food = RecipeFood.new(food: @food, recipe: @recipe, quantity: 10)
  end

  it 'name must not be blank' do
    @recipe_food.quantity = nil
    expect(subject).to_not be_valid
  end
end
