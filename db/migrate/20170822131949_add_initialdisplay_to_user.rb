class AddInitialdisplayToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :initial_display, :string, default: "personal"
  end
end
