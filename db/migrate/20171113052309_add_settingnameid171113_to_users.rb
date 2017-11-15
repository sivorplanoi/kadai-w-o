class AddSettingnameid171113ToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :setting_name, :string, length: { maximum: 15 }, default: ""
    add_column :users, :setting_id, :string, default: ""
  end
end
