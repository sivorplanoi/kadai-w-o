class AddNewclassificationToPersonallists < ActiveRecord::Migration[5.0]
  def change
    add_column :personallists, :classification, :string
  end
end
