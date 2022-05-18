class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @food = Food.new
    @user = User.find(params[:user_id])
  end

  def create
    @new_food = Food.create(food_params)
    @new_food.user_id = current_user.id
    if @new_food.save
    end
    redirect_to user_foods_path(current_user.id)
  end

  def destroy
    @food = Food.find(params[:id])
    @user = User.find(params[:user_id])
    @food.destroy
    if @food.destroy
    end
    redirect_to user_foods_path(current_user.id)
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
