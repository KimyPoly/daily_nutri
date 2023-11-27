class CreatePrograms < ActiveRecord::Migration[7.1]
  def change
    create_table :programs do |t|
      t.string :goal
      t.string :diet
      t.string :allergies
      t.integer :nb_of_meals_by_day
      t.integer :nb_of_days
      t.integer :nb_of_snacks
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
