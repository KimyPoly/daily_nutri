class AddMetaToPrograms < ActiveRecord::Migration[7.1]
  def change
    add_column :programs, :meta, :string
  end
end
