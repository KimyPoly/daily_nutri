class CreateMealAssignements < ActiveRecord::Migration[7.1]
  def change
    create_table :meal_assignements do |t|
      t.references :meal, null: false, foreign_key: true
      t.references :program, null: false, foreign_key: true

      t.timestamps
    end
  end
end
