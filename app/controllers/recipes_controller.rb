class RecipesController < ApplicationController
  def index
    current_user = 1
    @recipes = Recipe.where(['user_id = :id', { id: current_user.to_s }])
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = RecipeFood.where(['recipe_id = :id', { id: params[:id].to_s }])
  end

  def new; end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end
end
