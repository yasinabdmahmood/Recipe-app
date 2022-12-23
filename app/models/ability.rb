# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, PublicRecipe # start by defining rules for all users, also not logged ones
    return unless user.present?

    can :manage, Recipe, user_id: user.id # if the user is logged in can manage it's own posts
    can :create, Food
    can :destroy, Food, user_id: user.id
    can :create, RecipeFood  
    can :destroy, RecipeFood, food.id = user.id
    can :update, RecipeFood, food.id = user.id
  end
end
