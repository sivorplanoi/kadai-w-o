class CreatePersonallists < ActiveRecord::Migration[5.0]
  def change
    create_table :personallists do |t|
      t.string :content
      t.string :limit
      t.string :classification, default: "デフォルト"
      t.references :personaltab, foreign_key: true

      t.timestamps
    end
  end
end
