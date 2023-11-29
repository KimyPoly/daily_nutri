class RemoveFieldTypeOfMealFromMeal < ActiveRecord::Migration[7.1]
  def change
    remove_column :meals, :type_of_meal, :string
  end
end
