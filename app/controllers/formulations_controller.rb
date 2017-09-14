class FormulationsController < ApplicationController
  # GET /formulations
  def index
    render json: { formulations: Formulation.all.to_json(include: {ingredients: { }}) }
  end
end
