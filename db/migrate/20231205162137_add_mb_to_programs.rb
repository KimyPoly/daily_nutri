class AddMbToPrograms < ActiveRecord::Migration[7.1]
  def change
    add_column :programs, :mb, :float
  end
end
