class AddTypeToMeal < ActiveRecord::Migration[7.1]
  def change
    add_column :meals, :type, :string
  end
end
