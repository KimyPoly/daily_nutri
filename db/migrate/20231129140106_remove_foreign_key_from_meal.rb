class RemoveForeignKeyFromMeal < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :meals, :programs
  end
end
