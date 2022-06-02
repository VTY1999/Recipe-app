class FoodsController < ApplicationController
  before_action :authenticate_user!

  def index
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)

    if @food.save
      redirect_to foods_path, notice: 'Food created successfully!'
    else
      render action: 'new', alert: 'Food was not created!', status: :unprocessable_entity
    end
  end

  def destroy
    @food = Food.find(params[:id]).destroy

    if @food.destroyed?
      redirect_to foods_path, notice: 'Food successfully deleted!'
    else
      redirect_to foods_path, alert: 'Food is not deleted!'
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
