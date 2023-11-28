class AddTimeToMeal < ActiveRecord::Migration[7.1]
  def change
    add_column :meals, :time, :string
  end
end
