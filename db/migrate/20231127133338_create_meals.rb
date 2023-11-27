class CreateMeals < ActiveRecord::Migration[7.1]
  def change
    create_table :meals do |t|
      t.string :name
      t.text :recipe
      t.integer :day
      t.string :type_of_meal
      t.references :program, null: false, foreign_key: true

      t.timestamps
    end
  end
end
