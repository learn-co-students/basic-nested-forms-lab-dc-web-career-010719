class RecipesController < ApplicationController

  before_action :get_recipe, only: [:show]
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @ingredients = @recipe.ingredients.build(name: 'First')
    @ingredients = @recipe.ingredients.build(name: 'Second')
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe
    else render :new
    end
  end


  private
  def recipe_params
    params.require(:recipe).permit(
      :title,
      ingredients_attributes:
        [:name, :quantity, :recipe_id]
      )
  end

  def get_recipe
    @recipe = Recipe.find(params[:id])
  end

end
