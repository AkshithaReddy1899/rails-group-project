class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  def index
    @user = current_user
    @recipes = Recipe.where(user_id: @user.id)
  end

  def show
    @user = current_user
    @recipe = Recipe.find(params[:id])
    @recipe_foods = @recipe.recipe_foods.all
  end

  def new
    @user = current_user
    @recipe = @user.recipes.new
  end

  # GET /recipes/1/edit
  def edit; end

  def create
    # @user = current_user
    # @recipe = @user.recipes.new(recipe_params)
    @recipe = Recipe.new(
      name: recipe_params[:name],
      preparation_time: recipe_params[:preparation_time],
      cooking_time: recipe_params[:cooking_time],
      description: recipe_params[:description],
      public: recipe_params[:public],
      user_id: current_user.id
    )

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipes_path(current_user.id), notice: 'Recipe was successfully created.' }
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
    @user = current_user
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect_to recipe_path(@recipe.id) if @recipe.destroy
  end
end

private

def set_recipe
  @recipe = Recipe.find(params[:id])
end

def recipe_params
  params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :public, :description)
end
