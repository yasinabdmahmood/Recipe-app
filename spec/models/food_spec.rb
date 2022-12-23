require 'rails_helper'

RSpec.describe Food, type: :model do
  before :all do
    @user = User.new(name: 'benkis')
    @food = Food.new(user: @user, name: 'food_name', meadurement_unit: 'kg',price: 5, quantity: 10)
  end

  it 'name must not be blank' do
    @food.name = nil
    expect(subject).to_not be_valid
  end

  it 'meadurement_unit must not be blank' do
    @food.meadurement_unit = nil
    expect(subject).to_not be_valid
  end

  it 'price must not be blank' do
    @food.price = nil
    expect(subject).to_not be_valid
  end

  it 'quantity must not be blank' do
    @food.quantity = nil
    expect(subject).to_not be_valid
  end
end
