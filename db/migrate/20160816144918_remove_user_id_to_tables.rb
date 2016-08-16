class RemoveUserIdToTables < ActiveRecord::Migration[5.0]
  def change
    remove_column :reservations, :user_id, :integer
    remove_column :pools, :user_id, :integer
  end
end
