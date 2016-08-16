class AddUserIdToPools < ActiveRecord::Migration[5.0]
  def change
    add_reference :pools, :user, index: true, foreign_key: true
  end
end
