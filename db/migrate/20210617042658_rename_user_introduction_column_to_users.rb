class RenameUserIntroductionColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :user_introduction, :introduction
  end
end
