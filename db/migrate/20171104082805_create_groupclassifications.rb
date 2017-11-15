class CreateGroupclassifications < ActiveRecord::Migration[5.0]
  def change
    create_table :groupclassifications do |t|
      t.string :classification
      t.references :grouptab, foreign_key: true

      t.timestamps
    end
  end
end
