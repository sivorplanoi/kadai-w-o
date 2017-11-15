class AddSettingidToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :setting_id, :string, null: false, default: ""
  end
end
