class CreateGrouptabs < ActiveRecord::Migration[5.0]
  def change
    create_table :grouptabs do |t|
      t.string :name
      t.references :group, foreign_key: true
      t.string :active, default: ""

      t.timestamps
    end
  end
end
