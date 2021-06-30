class RenameUserImageColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :user_image, :image_name
  end
end
