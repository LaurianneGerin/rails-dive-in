class AddColumnNameToPools < ActiveRecord::Migration[5.0]
  def change
    add_column :pools, :name, :string
  end
end
