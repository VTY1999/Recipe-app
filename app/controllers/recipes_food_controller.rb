class RecipeFoodController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
    @foods = Food.all
  end

  def create
    @recipe_food = RecipeFood.new(
      quantity: ingredient_params[:quantity],
      food_id: ingredient_params[:food_id],
      recipe_id: params[:recipe_id]
    )

    if @recipe_food.save
      redirect_to user_recipe_path(current_user.id, params[:recipe_id]), notice: 'Operation done successfuly'
    else
      redirect_to new_user_recipe_recipe_food_path(current_user.id, params[:recipe_id]),
      alert: 'Somethifn went wrong, please try again!', status: :unprocessable_entity
    end
  end

  private

  def ingredient_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
