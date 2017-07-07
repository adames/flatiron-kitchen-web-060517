class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
    @ingredients = Ingredient.all
  end

  def create
    @recipe = Recipe.new(recipe_params)
    ingredients = params[:recipe][:ingredients]
    ingredients.each {|ingredient_id| @recipe.ingredients << Ingredient.find(ingredient_id)}
    @recipe.save
    redirect_to recipe_path(@recipe)
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

private

def recipe_params
  params.require(:recipe).permit(:name, :recipe_attributes)
end
end
