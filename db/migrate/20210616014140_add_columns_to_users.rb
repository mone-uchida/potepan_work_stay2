class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :user_image, :string
    add_column :users, :introduction, :content
  end
end
