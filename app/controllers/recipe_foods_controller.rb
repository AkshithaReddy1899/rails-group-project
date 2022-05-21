class RecipeFoodsController < ApplicationController
  def index
    @recipe_foods = RecipeFood.all
  end

  def show; end

  def new
    @foods = Food.all
    @recipe_food = RecipeFood.new
  end

  def edit
    @recipe_food = RecipeFood.find(params[:id])
    @foods = Food.all
  end

  def create
    @recipe_food = current_user.recipes.find(params[:recipe_id]).recipe_foods.new(recipe_food_params)

    respond_to do |format|
      if @recipe_food.save
        format.html { redirect_to recipe_path(@recipe_food.recipe_id), notice: 'Recipe food was successfully created.' }
        format.json { render :show, status: :created, location: @recipe_food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe_food.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    redirect_to recipe_path(params[:recipe_id]) if @recipe_food.destroy
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
