class CreatePersonalclassifications < ActiveRecord::Migration[5.0]
  def change
    create_table :personalclassifications do |t|
      t.string :classification
      t.references :personaltab, foreign_key: true

      t.timestamps
    end
  end
end
