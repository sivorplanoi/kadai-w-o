class AddInitialdisplayIdToInitialdisplay < ActiveRecord::Migration[5.0]
  def change
    add_column :initialdisplays, :initialdisplay_id, :int
  end
end
