class RemoveProgramIdOnMeals < ActiveRecord::Migration[7.1]
  def change
    remove_column :meals, :program_id
  end
end
