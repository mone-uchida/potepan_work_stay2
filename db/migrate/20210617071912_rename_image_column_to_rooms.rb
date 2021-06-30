class RenameImageColumnToRooms < ActiveRecord::Migration[6.1]
  def change
    rename_column :rooms, :image, :image_name
    end
end
