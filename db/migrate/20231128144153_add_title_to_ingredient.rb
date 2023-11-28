class AddTitleToIngredient < ActiveRecord::Migration[7.1]
  def change
    add_column :ingredients, :title, :string
  end
end
