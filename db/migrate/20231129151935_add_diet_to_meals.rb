class AddDietToMeals < ActiveRecord::Migration[7.1]
  def change
    add_column :meals, :diet, :string
  end
end
