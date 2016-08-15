class CreateAvailabilities < ActiveRecord::Migration[5.0]
  def change
    create_table :availabilities do |t|
      t.date :begin_date
      t.date :end_date
      t.references :pool, foreign_key: true

      t.timestamps
    end
  end
end
