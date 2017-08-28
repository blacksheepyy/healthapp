class AddUserIdAndLinemanagerToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :user_id, :integer
    add_column :articles, :user_linemanager, :string
  end
end
