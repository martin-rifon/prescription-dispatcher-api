class IngredientsController < ApplicationController
  # GET /ingredients
  def index
    render json: { ingredients: Ingredient.all }
  end
end
