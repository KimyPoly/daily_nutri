class AddIngredientsToMeal < ActiveRecord::Migration[7.1]
  def change
    add_column :meals, :ingredients, :string
  end
end
