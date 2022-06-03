class ShopController < ApplicationController
  def index
    @foods = Food.all
    @recipe_food = RecipeFood.where(recipe_id: params[:recipe_id]).includes(:food)
    food = Food.where(user: current_user)
    list_recipe_food = @recipe_food.where.not(food: {name: food.name})

    @total_amount = list_recipe_food.count
  end
end
