class CreateIdUniqueValidates < ActiveRecord::Migration[5.0]
  def change
    create_table :id_unique_validates do |t|

      t.timestamps
    end
  end
end
