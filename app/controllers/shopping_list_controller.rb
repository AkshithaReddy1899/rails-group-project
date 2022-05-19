class ShoppingListController < ApplicationController
  def index
    @user = current_user
    @recipe = Recipe.where(user_id: @user.id)
    @recipe_foods = RecipeFood.all
    @foods = Food.where(user_id: @user.id)
    @recipes = @user.recipes
    @total = 0
    # @recipe.each do |recipe|
    #   @total += Recipe.total
    # end
  end
end
