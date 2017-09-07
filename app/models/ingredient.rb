class Ingredient < ActiveRecord::Base
  serialize :classes, Array
end
