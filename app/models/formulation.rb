class Formulation < ActiveRecord::Base
  has_and_belongs_to_many :ingredients, -> { select('ingredients.*, formulations_ingredients.percentage') }
end
