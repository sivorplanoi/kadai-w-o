class AddIndexToUsers < ActiveRecord::Migration[5.0]
  def change
    add_index :users, :setting_id, unique: true
  end
end
