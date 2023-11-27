class AddHeightAndWeightToProgram < ActiveRecord::Migration[7.1]
  def change
    add_column :programs, :height, :float
    add_column :programs, :weight, :float
  end
end
