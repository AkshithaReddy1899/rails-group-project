class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  def index
    @recipes = Recipe.includes(:user).where(user_id: params[:user_id])
    @user = User.find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @recipe = @user.recipes.find(params[:id])
  end

  def new
    @user = current_user
    @recipe = @user.recipes.new
  end

  # GET /recipes/1/edit
  def edit; end

  def create
    @user = current_user
    @recipe = @user.recipes.new(recipe_params)
    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @user = current_user
    @recipe = @user.recipes.find(params[:id])
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to user_recipes_path(params[:user_id]), notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
end

private

def set_recipe
  @recipe = Recipe.find(params[:id])
end

def recipe_params
  params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :user_id)
end
