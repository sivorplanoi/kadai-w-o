class CreateInitialdisplays < ActiveRecord::Migration[5.0]
  def change
    create_table :initialdisplays do |t|
      t.string :initialdisplay_key
      t.string :username

      t.timestamps
    end
  end
end
