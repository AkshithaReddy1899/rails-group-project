class FoodsController < ApplicationController
  load_and_authorize_resource
  def index
    @foods = Food.includes(:user).where(user_id: params[:user_id])
    @user = User.find(params[:user_id])
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @food = Food.new
    @user = User.find(params[:user_id])
  end

  def create
    @user = User.find(params[:user_id])
    @new_food = Food.create(food_params)
    @new_food.user_id = @user.id
    if @new_food.save
      redirect_to user_foods_path(@user.id)
    else
      redirect_to user_foods_path(@user.id)
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @user = User.find(params[:user_id])
    @food.destroy
    redirect_to user_foods_path(current_user.id)
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
