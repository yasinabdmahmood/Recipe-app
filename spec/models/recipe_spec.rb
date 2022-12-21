require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before :all do
    @user = User.new(name: 'yasin')
    @recipe = Recipe.new(user: @user, name: 'test name', preparation_time: 1,
                         cooking_time: 1, description: 'test description', public: true)
  end

  it 'name must not be blank' do
    @recipe.name = nil
    expect(subject).to_not be_valid
  end

  it 'preparation_time must not be blank' do
    @recipe.preparation_time = nil
    expect(subject).to_not be_valid
  end

  it 'cooking_time must not be blank' do
    @recipe.cooking_time = nil
    expect(subject).to_not be_valid
  end

  it 'preparation_time must be an numirical ' do
    @recipe.preparation_time = 'xyz'
    expect(subject).to_not be_valid
  end

  it 'cooking_time must be an numirical ' do
    @recipe.cooking_time = 'xyz'
    expect(subject).to_not be_valid
  end
end
