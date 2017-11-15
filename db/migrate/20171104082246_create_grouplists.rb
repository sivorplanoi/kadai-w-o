class CreateGrouplists < ActiveRecord::Migration[5.0]
  def change
    create_table :grouplists do |t|
      t.string :content
      t.string :limit
      t.string :classification, default: "デフォルト"
      t.references :grouptab, foreign_key: true

      t.timestamps
    end
  end
end
