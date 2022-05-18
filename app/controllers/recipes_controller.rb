class RecipesController < ApplicationController
  before_action :set_recipe, only: %i[show edit update destroy]

  def index
    @user = current_user
    @recipes = @user.recipes.all
  end

  def show
    @user = current_user
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
        format.html { redirect_to user_url(@recipe), notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end
end

def update
  @user = current_user
  respond_to do |format|
    if @recipe.update(recipe_params)
      format.html { redirect_to user_url(@recipe), notice: 'Recipe was successfully updated.' }
      format.json { render :show, status: :ok, location: @recipe }
    else
      format.html { render :edit, status: :unprocessable_entity }
      format.json { render json: @recipe.errors, status: :unprocessable_entity }
    end
  end
end

def destroy
  @user = current_user
  @recipe.destroy
  respond_to do |format|
    format.html { redirect_to user_url(@recipe), notice: 'Recipe was successfully destroyed.' }
    format.json { head :no_content }
  end
end

private

def set_recipe
  @recipe = Recipe.find(params[:id])
end

def recipe_params
  params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public, :user_id)
end
