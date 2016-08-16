class CreateAvailabilities < ActiveRecord::Migration[5.0]
  def change
    create_table :availabilities do |t|
      t.references :pool, foreign_key: true
      t.date :begin_date
      t.date :end_date

      t.timestamps
    end
  end
end
