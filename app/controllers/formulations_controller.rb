class FormulationsController < ApplicationController
  # GET /formulations
  def index
    render json: { formulations: Formulation.all }
  end
end
