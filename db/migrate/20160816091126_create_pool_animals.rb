class CreatePoolAnimals < ActiveRecord::Migration[5.0]
  def change
    create_table :pool_animals do |t|
      t.references :animal, foreign_key: true
      t.references :pool, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
