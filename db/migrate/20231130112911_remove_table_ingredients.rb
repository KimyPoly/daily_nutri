class RemoveTableIngredients < ActiveRecord::Migration[7.1]
  def change
    drop_table :ingredients
  end
end
