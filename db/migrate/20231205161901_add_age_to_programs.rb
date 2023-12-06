class AddAgeToPrograms < ActiveRecord::Migration[7.1]
  def change
    add_column :programs, :age, :integer
  end
end
