class AddPriceToMeal < ActiveRecord::Migration[7.1]
  def change
    add_column :meals, :price, :integer
  end
end
