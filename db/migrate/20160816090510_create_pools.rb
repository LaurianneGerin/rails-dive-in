class CreatePools < ActiveRecord::Migration[5.0]
  def change
    create_table :pools do |t|
      t.references :user, foreign_key: true
      t.integer :width
      t.integer :height
      t.integer :depth
      t.string :color
      t.boolean :pool_house
      t.boolean :pool_toys
      t.string :pool_type
      t.string :water_type
      t.integer :capacity
      t.text :description
      t.boolean :alcohol
      t.boolean :soft
      t.boolean :bbq
      t.integer :pool_girl
      t.integer :pool_boy
      t.string :address

      t.timestamps
    end
  end
end
