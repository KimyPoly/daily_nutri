class AddWeekDayToMeal < ActiveRecord::Migration[7.1]
  def change
    add_column :meals, :week_day, :string
  end
end
