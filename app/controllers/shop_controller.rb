class ShopController < ApplicationController
  def index
    @foods = Food.all
    @recipe = RecipeFood.includes(:food).where(recipe_id: params[:recipe_id])
  end
end
