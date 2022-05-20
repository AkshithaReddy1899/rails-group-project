class FoodsController < ApplicationController
  load_and_authorize_resource
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
    @user = current_user
  end

  def create
    @user = current_user
    @new_food = Food.create(food_params)
    @new_food.user_id = @user.id
    @new_food.save
    redirect_to foods_path(@user.id)
  end

  def destroy
    @food = Food.find(params[:id])
    @user = current_user
    @food.destroy
    redirect_to foods_path(current_user.id)
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
