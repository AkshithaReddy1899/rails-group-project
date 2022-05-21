require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before do
		@food = Food.new(name: 'Apple', measurement_unit: 20, price: 1, user_id: 1)
		@recipe = Recipe.new(name: 'Recipe Name', preparation_time: '2 hours', cooking_time: '1 hour', description: 'Recipe Description', public: false, user_id: 1)
    @recipe_food = RecipeFood.new(quantity: 20, food_id: 1, recipe_id: 1)
  end

  it 'Quantity should not be greater than or equalt to 1' do
    expect(@recipe_food.quantity).to be >= 1
  end

end
