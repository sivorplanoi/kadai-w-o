class RemoveClassificationFromPersonallists < ActiveRecord::Migration[5.0]
  def change
    remove_column :personallists, :classification, :string
  end
end
