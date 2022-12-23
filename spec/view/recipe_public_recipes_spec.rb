require 'rails_helper'

RSpec.describe 'Recipe index page', type: :feature do
  before(:example) do
    @user = User.create(name: 'Yaseen', email: 'test@test.com', password: 'password', password_confirmation: 'password')
    @recipe1 = Recipe.create(user: @user, name: 'recipe1', preparation_time: 1, cooking_time: 1,
                             description: 'description1', public: true)
    @recipe2 = Recipe.create(user: @user, name: 'recipe2', preparation_time: 1, cooking_time: 1,
                             description: 'description2', public: false)
    @user2 = User.create(name: 'Ali', email: 'test@test2.com', password: 'password', password_confirmation: 'password')
    @recipe3 = Recipe.create(user: @user2, name: 'recipe3', preparation_time: 1, cooking_time: 1,
                             description: 'description1', public: true)
    @recipe4 = Recipe.create(user: @user2, name: 'recipe4', preparation_time: 1, cooking_time: 1,
                             description: 'description2', public: false)
    sign_in @user
    visit recipe_public_recipes_path
  end

  describe 'recipe index page' do
    it ' -> I can see the names of the recipe creator.' do
      expect(page).to have_content(@user.name)
      expect(page).to have_content(@user2.name)
    end

    it ' -> I can see only the public recipes of the first user.' do
      expect(page).to have_content(@recipe1.name)
      expect(page).to_not have_content(@recipe2.name)
    end

    it ' -> I can see only the public recipes of the second user.' do
      expect(page).to have_content(@recipe3.name)
      expect(page).to_not have_content(@recipe4.name)
    end
  end
end
