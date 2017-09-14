class CreateInitialSchema < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.text :description
      t.integer :minimum_percentage
      t.integer :maximum_percentage
      t.text :classes, array: true
    end

    create_table :formulations do |t|
      t.string :name
    end

    create_join_table :formulations, :ingredients do |t|
      t.index :formulation_id
      t.index :ingredient_id
      t.float :percentage
    end
  end
end
