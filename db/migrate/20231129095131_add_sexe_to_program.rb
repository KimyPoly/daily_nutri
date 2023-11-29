class AddSexeToProgram < ActiveRecord::Migration[7.1]
  def change
    add_column :programs, :sexe, :string
  end
end
