class AddSelectedToMeal < ActiveRecord::Migration[7.1]
  def change
    add_column :meals, :selected, :boolean, default: false
  end
end
