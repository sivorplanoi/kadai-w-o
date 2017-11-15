class AddActiveToPersonaltabs < ActiveRecord::Migration[5.0]
  def change
    add_column :personaltabs, :active, :string, default: ""
  end
end
