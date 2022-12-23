class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, RecipeFood # start by defining rules for all users, also not logged ones
    return unless user.present?

    can :manage, Recipe, user_id: user.id # if the user is logged in can manage it's own posts
    can :create, Food
    can :destroy, Food, user_id: user.id
    can :create, RecipeFood
  end
end
