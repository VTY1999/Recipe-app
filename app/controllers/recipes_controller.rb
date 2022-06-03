class RecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipe = current_user.recipes
  end

  def show
    @recipe = Recipe.includes(:recipe_foods).find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user

    if @recipe.save
      redirect_to recipes_path(id: @recipe.user_id)
      flash[:notice] = 'Recipe added successfully!'
    else
      render :new
      flash[:alert] = 'Recipe not added'
    end
  end

  def destroy
    @recipe = Recipe.destroy(params[:id])
    if @recipe.destroyed?
      redirect_to recipes_path
    else
      render :new, alert: 'Oops something went wrong!'
    end
  end

  def public_recipes
    @recipes = Recipe.where('public = true').order(id: :desc).includes(:foods).includes(:user)
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :public, :description)
  end
  private :recipe_params
end
