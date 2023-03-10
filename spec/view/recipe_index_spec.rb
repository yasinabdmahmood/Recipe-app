require 'rails_helper'

RSpec.describe 'Recipe index page', type: :feature do
  before(:example) do
    @user = User.create(name: 'Yaseen', email: 'test@test.com', password: 'password', password_confirmation: 'password')
    @recipe1 = Recipe.create(user: @user, name: 'recipe1', preparation_time: 1, cooking_time: 1,
                             description: 'description1', public: true)
    @recipe2 = Recipe.create(user: @user, name: 'recipe2', preparation_time: 1, cooking_time: 1,
                             description: 'description2', public: false)
    sign_in @user
    visit recipe_index_path
  end

  describe 'recipe index page' do
    it ' -> I can see the username of the logged in user in the navbar.' do
      expect(page).to have_content(@user.name)
    end

    it ' -> I can see the list of the recipes names of logged in user.' do
      expect(page).to have_content(@recipe1.name)
      expect(page).to have_content(@recipe2.name)
    end

    it ' -> I can see the username of the logged in user in the navbar.' do
      expect(page).to have_content(@recipe1.description)
      expect(page).to have_content(@recipe2.description)
    end

    it ' -> I can see the remove button link' do
      expect(page).to have_content('Delete')
    end
  end
end
