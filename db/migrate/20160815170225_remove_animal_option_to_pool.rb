class RemoveAnimalOptionToPool < ActiveRecord::Migration[5.0]
  def change
    remove_column :pools, :animal_option_id, :integer
  end
end
