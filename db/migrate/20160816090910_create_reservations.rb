class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.references :user, foreign_key: true
      t.references :pool, foreign_key: true
      t.date :begin_date
      t.date :end_date
      t.string :statut

      t.timestamps
    end
  end
end
